; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63956 () Bool)

(assert start!63956)

(declare-fun b!718519 () Bool)

(declare-fun e!403346 () Bool)

(declare-fun e!403344 () Bool)

(assert (=> b!718519 (= e!403346 e!403344)))

(declare-fun res!480999 () Bool)

(assert (=> b!718519 (=> (not res!480999) (not e!403344))))

(declare-datatypes ((SeekEntryResult!7075 0))(
  ( (MissingZero!7075 (index!30668 (_ BitVec 32))) (Found!7075 (index!30669 (_ BitVec 32))) (Intermediate!7075 (undefined!7887 Bool) (index!30670 (_ BitVec 32)) (x!61679 (_ BitVec 32))) (Undefined!7075) (MissingVacant!7075 (index!30671 (_ BitVec 32))) )
))
(declare-fun lt!319381 () SeekEntryResult!7075)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718519 (= res!480999 (or (= lt!319381 (MissingZero!7075 i!1173)) (= lt!319381 (MissingVacant!7075 i!1173))))))

(declare-datatypes ((array!40696 0))(
  ( (array!40697 (arr!19475 (Array (_ BitVec 32) (_ BitVec 64))) (size!19896 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40696)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40696 (_ BitVec 32)) SeekEntryResult!7075)

(assert (=> b!718519 (= lt!319381 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718520 () Bool)

(declare-fun res!481000 () Bool)

(assert (=> b!718520 (=> (not res!481000) (not e!403346))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!718520 (= res!481000 (and (= (size!19896 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19896 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19896 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718521 () Bool)

(declare-fun res!481006 () Bool)

(assert (=> b!718521 (=> (not res!481006) (not e!403346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718521 (= res!481006 (validKeyInArray!0 k!2102))))

(declare-fun b!718522 () Bool)

(declare-fun res!481003 () Bool)

(assert (=> b!718522 (=> (not res!481003) (not e!403344))))

(declare-datatypes ((List!13477 0))(
  ( (Nil!13474) (Cons!13473 (h!14518 (_ BitVec 64)) (t!19792 List!13477)) )
))
(declare-fun arrayNoDuplicates!0 (array!40696 (_ BitVec 32) List!13477) Bool)

(assert (=> b!718522 (= res!481003 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13474))))

(declare-fun b!718523 () Bool)

(declare-fun lt!319382 () (_ BitVec 32))

(assert (=> b!718523 (= e!403344 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319382 #b00000000000000000000000000000000) (bvsge lt!319382 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718523 (= lt!319382 (toIndex!0 (select (arr!19475 a!3186) j!159) mask!3328))))

(declare-fun b!718524 () Bool)

(declare-fun res!481001 () Bool)

(assert (=> b!718524 (=> (not res!481001) (not e!403344))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718524 (= res!481001 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19896 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19896 a!3186))))))

(declare-fun b!718525 () Bool)

(declare-fun res!481005 () Bool)

(assert (=> b!718525 (=> (not res!481005) (not e!403346))))

(assert (=> b!718525 (= res!481005 (validKeyInArray!0 (select (arr!19475 a!3186) j!159)))))

(declare-fun b!718526 () Bool)

(declare-fun res!481004 () Bool)

(assert (=> b!718526 (=> (not res!481004) (not e!403344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40696 (_ BitVec 32)) Bool)

(assert (=> b!718526 (= res!481004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718527 () Bool)

(declare-fun res!481002 () Bool)

(assert (=> b!718527 (=> (not res!481002) (not e!403346))))

(declare-fun arrayContainsKey!0 (array!40696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718527 (= res!481002 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481007 () Bool)

(assert (=> start!63956 (=> (not res!481007) (not e!403346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63956 (= res!481007 (validMask!0 mask!3328))))

(assert (=> start!63956 e!403346))

(assert (=> start!63956 true))

(declare-fun array_inv!15271 (array!40696) Bool)

(assert (=> start!63956 (array_inv!15271 a!3186)))

(assert (= (and start!63956 res!481007) b!718520))

(assert (= (and b!718520 res!481000) b!718525))

(assert (= (and b!718525 res!481005) b!718521))

(assert (= (and b!718521 res!481006) b!718527))

(assert (= (and b!718527 res!481002) b!718519))

(assert (= (and b!718519 res!480999) b!718526))

(assert (= (and b!718526 res!481004) b!718522))

(assert (= (and b!718522 res!481003) b!718524))

(assert (= (and b!718524 res!481001) b!718523))

(declare-fun m!674141 () Bool)

(assert (=> b!718523 m!674141))

(assert (=> b!718523 m!674141))

(declare-fun m!674143 () Bool)

(assert (=> b!718523 m!674143))

(declare-fun m!674145 () Bool)

(assert (=> b!718526 m!674145))

(declare-fun m!674147 () Bool)

(assert (=> b!718522 m!674147))

(declare-fun m!674149 () Bool)

(assert (=> b!718519 m!674149))

(declare-fun m!674151 () Bool)

(assert (=> start!63956 m!674151))

(declare-fun m!674153 () Bool)

(assert (=> start!63956 m!674153))

(declare-fun m!674155 () Bool)

(assert (=> b!718527 m!674155))

(declare-fun m!674157 () Bool)

(assert (=> b!718521 m!674157))

(assert (=> b!718525 m!674141))

(assert (=> b!718525 m!674141))

(declare-fun m!674159 () Bool)

(assert (=> b!718525 m!674159))

(push 1)

(assert (not b!718526))

(assert (not b!718523))

(assert (not b!718519))

(assert (not b!718525))

(assert (not start!63956))

(assert (not b!718521))

(assert (not b!718527))

(assert (not b!718522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99021 () Bool)

(declare-fun res!481028 () Bool)

(declare-fun e!403376 () Bool)

(assert (=> d!99021 (=> res!481028 e!403376)))

(assert (=> d!99021 (= res!481028 (bvsge #b00000000000000000000000000000000 (size!19896 a!3186)))))

(assert (=> d!99021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403376)))

(declare-fun b!718563 () Bool)

(declare-fun e!403374 () Bool)

(assert (=> b!718563 (= e!403376 e!403374)))

(declare-fun c!79135 () Bool)

(assert (=> b!718563 (= c!79135 (validKeyInArray!0 (select (arr!19475 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718564 () Bool)

(declare-fun call!34740 () Bool)

(assert (=> b!718564 (= e!403374 call!34740)))

(declare-fun b!718565 () Bool)

(declare-fun e!403375 () Bool)

(assert (=> b!718565 (= e!403374 e!403375)))

(declare-fun lt!319398 () (_ BitVec 64))

(assert (=> b!718565 (= lt!319398 (select (arr!19475 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24668 0))(
  ( (Unit!24669) )
))
(declare-fun lt!319400 () Unit!24668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40696 (_ BitVec 64) (_ BitVec 32)) Unit!24668)

(assert (=> b!718565 (= lt!319400 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319398 #b00000000000000000000000000000000))))

(assert (=> b!718565 (arrayContainsKey!0 a!3186 lt!319398 #b00000000000000000000000000000000)))

(declare-fun lt!319399 () Unit!24668)

(assert (=> b!718565 (= lt!319399 lt!319400)))

(declare-fun res!481027 () Bool)

(assert (=> b!718565 (= res!481027 (= (seekEntryOrOpen!0 (select (arr!19475 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7075 #b00000000000000000000000000000000)))))

(assert (=> b!718565 (=> (not res!481027) (not e!403375))))

(declare-fun bm!34737 () Bool)

(assert (=> bm!34737 (= call!34740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718566 () Bool)

(assert (=> b!718566 (= e!403375 call!34740)))

(assert (= (and d!99021 (not res!481028)) b!718563))

(assert (= (and b!718563 c!79135) b!718565))

(assert (= (and b!718563 (not c!79135)) b!718564))

(assert (= (and b!718565 res!481027) b!718566))

(assert (= (or b!718566 b!718564) bm!34737))

(declare-fun m!674177 () Bool)

(assert (=> b!718563 m!674177))

(assert (=> b!718563 m!674177))

(declare-fun m!674179 () Bool)

(assert (=> b!718563 m!674179))

(assert (=> b!718565 m!674177))

(declare-fun m!674181 () Bool)

(assert (=> b!718565 m!674181))

(declare-fun m!674183 () Bool)

(assert (=> b!718565 m!674183))

(assert (=> b!718565 m!674177))

(declare-fun m!674185 () Bool)

(assert (=> b!718565 m!674185))

(declare-fun m!674187 () Bool)

(assert (=> bm!34737 m!674187))

(assert (=> b!718526 d!99021))

(declare-fun d!99023 () Bool)

(assert (=> d!99023 (= (validKeyInArray!0 (select (arr!19475 a!3186) j!159)) (and (not (= (select (arr!19475 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19475 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718525 d!99023))

(declare-fun d!99025 () Bool)

(declare-fun lt!319432 () SeekEntryResult!7075)

(assert (=> d!99025 (and (or (is-Undefined!7075 lt!319432) (not (is-Found!7075 lt!319432)) (and (bvsge (index!30669 lt!319432) #b00000000000000000000000000000000) (bvslt (index!30669 lt!319432) (size!19896 a!3186)))) (or (is-Undefined!7075 lt!319432) (is-Found!7075 lt!319432) (not (is-MissingZero!7075 lt!319432)) (and (bvsge (index!30668 lt!319432) #b00000000000000000000000000000000) (bvslt (index!30668 lt!319432) (size!19896 a!3186)))) (or (is-Undefined!7075 lt!319432) (is-Found!7075 lt!319432) (is-MissingZero!7075 lt!319432) (not (is-MissingVacant!7075 lt!319432)) (and (bvsge (index!30671 lt!319432) #b00000000000000000000000000000000) (bvslt (index!30671 lt!319432) (size!19896 a!3186)))) (or (is-Undefined!7075 lt!319432) (ite (is-Found!7075 lt!319432) (= (select (arr!19475 a!3186) (index!30669 lt!319432)) k!2102) (ite (is-MissingZero!7075 lt!319432) (= (select (arr!19475 a!3186) (index!30668 lt!319432)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7075 lt!319432) (= (select (arr!19475 a!3186) (index!30671 lt!319432)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!403413 () SeekEntryResult!7075)

(assert (=> d!99025 (= lt!319432 e!403413)))

(declare-fun c!79160 () Bool)

(declare-fun lt!319431 () SeekEntryResult!7075)

(assert (=> d!99025 (= c!79160 (and (is-Intermediate!7075 lt!319431) (undefined!7887 lt!319431)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40696 (_ BitVec 32)) SeekEntryResult!7075)

(assert (=> d!99025 (= lt!319431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99025 (validMask!0 mask!3328)))

(assert (=> d!99025 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319432)))

(declare-fun b!718627 () Bool)

(declare-fun e!403414 () SeekEntryResult!7075)

(assert (=> b!718627 (= e!403414 (MissingZero!7075 (index!30670 lt!319431)))))

(declare-fun b!718628 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40696 (_ BitVec 32)) SeekEntryResult!7075)

(assert (=> b!718628 (= e!403414 (seekKeyOrZeroReturnVacant!0 (x!61679 lt!319431) (index!30670 lt!319431) (index!30670 lt!319431) k!2102 a!3186 mask!3328))))

(declare-fun b!718629 () Bool)

(declare-fun e!403415 () SeekEntryResult!7075)

(assert (=> b!718629 (= e!403415 (Found!7075 (index!30670 lt!319431)))))

(declare-fun b!718630 () Bool)

(assert (=> b!718630 (= e!403413 e!403415)))

(declare-fun lt!319433 () (_ BitVec 64))

(assert (=> b!718630 (= lt!319433 (select (arr!19475 a!3186) (index!30670 lt!319431)))))

(declare-fun c!79162 () Bool)

(assert (=> b!718630 (= c!79162 (= lt!319433 k!2102))))

(declare-fun b!718631 () Bool)

(assert (=> b!718631 (= e!403413 Undefined!7075)))

(declare-fun b!718632 () Bool)

(declare-fun c!79161 () Bool)

(assert (=> b!718632 (= c!79161 (= lt!319433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!718632 (= e!403415 e!403414)))

(assert (= (and d!99025 c!79160) b!718631))

(assert (= (and d!99025 (not c!79160)) b!718630))

(assert (= (and b!718630 c!79162) b!718629))

(assert (= (and b!718630 (not c!79162)) b!718632))

(assert (= (and b!718632 c!79161) b!718627))

(assert (= (and b!718632 (not c!79161)) b!718628))

(declare-fun m!674223 () Bool)

(assert (=> d!99025 m!674223))

(declare-fun m!674225 () Bool)

(assert (=> d!99025 m!674225))

(assert (=> d!99025 m!674223))

(declare-fun m!674227 () Bool)

(assert (=> d!99025 m!674227))

(declare-fun m!674229 () Bool)

(assert (=> d!99025 m!674229))

(assert (=> d!99025 m!674151))

(declare-fun m!674231 () Bool)

(assert (=> d!99025 m!674231))

(declare-fun m!674233 () Bool)

(assert (=> b!718628 m!674233))

(declare-fun m!674235 () Bool)

(assert (=> b!718630 m!674235))

(assert (=> b!718519 d!99025))

(declare-fun d!99045 () Bool)

(declare-fun lt!319445 () (_ BitVec 32))

(declare-fun lt!319444 () (_ BitVec 32))

(assert (=> d!99045 (= lt!319445 (bvmul (bvxor lt!319444 (bvlshr lt!319444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99045 (= lt!319444 ((_ extract 31 0) (bvand (bvxor (select (arr!19475 a!3186) j!159) (bvlshr (select (arr!19475 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99045 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!481042 (let ((h!14520 ((_ extract 31 0) (bvand (bvxor (select (arr!19475 a!3186) j!159) (bvlshr (select (arr!19475 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61681 (bvmul (bvxor h!14520 (bvlshr h!14520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61681 (bvlshr x!61681 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!481042 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!481042 #b00000000000000000000000000000000))))))

(assert (=> d!99045 (= (toIndex!0 (select (arr!19475 a!3186) j!159) mask!3328) (bvand (bvxor lt!319445 (bvlshr lt!319445 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!718523 d!99045))

(declare-fun d!99047 () Bool)

(declare-fun res!481053 () Bool)

(declare-fun e!403429 () Bool)

(assert (=> d!99047 (=> res!481053 e!403429)))

(assert (=> d!99047 (= res!481053 (= (select (arr!19475 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99047 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!403429)))

(declare-fun b!718649 () Bool)

(declare-fun e!403430 () Bool)

(assert (=> b!718649 (= e!403429 e!403430)))

(declare-fun res!481054 () Bool)

(assert (=> b!718649 (=> (not res!481054) (not e!403430))))

(assert (=> b!718649 (= res!481054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19896 a!3186)))))

(declare-fun b!718650 () Bool)

(assert (=> b!718650 (= e!403430 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99047 (not res!481053)) b!718649))

(assert (= (and b!718649 res!481054) b!718650))

(assert (=> d!99047 m!674177))

(declare-fun m!674247 () Bool)

(assert (=> b!718650 m!674247))

(assert (=> b!718527 d!99047))

(declare-fun b!718676 () Bool)

(declare-fun e!403451 () Bool)

(declare-fun call!34749 () Bool)

(assert (=> b!718676 (= e!403451 call!34749)))

(declare-fun b!718677 () Bool)

(declare-fun e!403453 () Bool)

(declare-fun contains!4039 (List!13477 (_ BitVec 64)) Bool)

(assert (=> b!718677 (= e!403453 (contains!4039 Nil!13474 (select (arr!19475 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99055 () Bool)

(declare-fun res!481072 () Bool)

(declare-fun e!403454 () Bool)

(assert (=> d!99055 (=> res!481072 e!403454)))

(assert (=> d!99055 (= res!481072 (bvsge #b00000000000000000000000000000000 (size!19896 a!3186)))))

(assert (=> d!99055 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13474) e!403454)))

(declare-fun b!718678 () Bool)

(assert (=> b!718678 (= e!403451 call!34749)))

(declare-fun b!718679 () Bool)

(declare-fun e!403452 () Bool)

(assert (=> b!718679 (= e!403454 e!403452)))

(declare-fun res!481071 () Bool)

(assert (=> b!718679 (=> (not res!481071) (not e!403452))))

(assert (=> b!718679 (= res!481071 (not e!403453))))

(declare-fun res!481070 () Bool)

(assert (=> b!718679 (=> (not res!481070) (not e!403453))))

(assert (=> b!718679 (= res!481070 (validKeyInArray!0 (select (arr!19475 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718680 () Bool)

(assert (=> b!718680 (= e!403452 e!403451)))

(declare-fun c!79171 () Bool)

(assert (=> b!718680 (= c!79171 (validKeyInArray!0 (select (arr!19475 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34746 () Bool)

(assert (=> bm!34746 (= call!34749 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79171 (Cons!13473 (select (arr!19475 a!3186) #b00000000000000000000000000000000) Nil!13474) Nil!13474)))))

(assert (= (and d!99055 (not res!481072)) b!718679))

(assert (= (and b!718679 res!481070) b!718677))

(assert (= (and b!718679 res!481071) b!718680))

(assert (= (and b!718680 c!79171) b!718678))

(assert (= (and b!718680 (not c!79171)) b!718676))

(assert (= (or b!718678 b!718676) bm!34746))

(assert (=> b!718677 m!674177))

(assert (=> b!718677 m!674177))

(declare-fun m!674253 () Bool)

(assert (=> b!718677 m!674253))

(assert (=> b!718679 m!674177))

(assert (=> b!718679 m!674177))

(assert (=> b!718679 m!674179))

(assert (=> b!718680 m!674177))

(assert (=> b!718680 m!674177))

(assert (=> b!718680 m!674179))

(assert (=> bm!34746 m!674177))

(declare-fun m!674255 () Bool)

(assert (=> bm!34746 m!674255))

(assert (=> b!718522 d!99055))

(declare-fun d!99059 () Bool)

(assert (=> d!99059 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63956 d!99059))

(declare-fun d!99063 () Bool)

(assert (=> d!99063 (= (array_inv!15271 a!3186) (bvsge (size!19896 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63956 d!99063))

(declare-fun d!99065 () Bool)

(assert (=> d!99065 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718521 d!99065))

(push 1)

