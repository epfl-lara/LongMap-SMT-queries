; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64112 () Bool)

(assert start!64112)

(declare-fun b!720260 () Bool)

(declare-fun res!482627 () Bool)

(declare-fun e!403975 () Bool)

(assert (=> b!720260 (=> (not res!482627) (not e!403975))))

(declare-datatypes ((array!40807 0))(
  ( (array!40808 (arr!19529 (Array (_ BitVec 32) (_ BitVec 64))) (size!19950 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40807)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720260 (= res!482627 (validKeyInArray!0 (select (arr!19529 a!3186) j!159)))))

(declare-fun b!720261 () Bool)

(declare-fun res!482621 () Bool)

(assert (=> b!720261 (=> (not res!482621) (not e!403975))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!720261 (= res!482621 (validKeyInArray!0 k!2102))))

(declare-fun b!720262 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!403976 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7129 0))(
  ( (MissingZero!7129 (index!30884 (_ BitVec 32))) (Found!7129 (index!30885 (_ BitVec 32))) (Intermediate!7129 (undefined!7941 Bool) (index!30886 (_ BitVec 32)) (x!61880 (_ BitVec 32))) (Undefined!7129) (MissingVacant!7129 (index!30887 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720262 (= e!403976 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19529 a!3186) j!159) a!3186 mask!3328) (Found!7129 j!159)))))

(declare-fun b!720264 () Bool)

(declare-fun res!482628 () Bool)

(declare-fun e!403972 () Bool)

(assert (=> b!720264 (=> (not res!482628) (not e!403972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40807 (_ BitVec 32)) Bool)

(assert (=> b!720264 (= res!482628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720265 () Bool)

(assert (=> b!720265 (= e!403975 e!403972)))

(declare-fun res!482622 () Bool)

(assert (=> b!720265 (=> (not res!482622) (not e!403972))))

(declare-fun lt!319733 () SeekEntryResult!7129)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720265 (= res!482622 (or (= lt!319733 (MissingZero!7129 i!1173)) (= lt!319733 (MissingVacant!7129 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720265 (= lt!319733 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720266 () Bool)

(declare-fun res!482623 () Bool)

(assert (=> b!720266 (=> (not res!482623) (not e!403975))))

(declare-fun arrayContainsKey!0 (array!40807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720266 (= res!482623 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720267 () Bool)

(declare-fun res!482630 () Bool)

(assert (=> b!720267 (=> (not res!482630) (not e!403972))))

(declare-datatypes ((List!13531 0))(
  ( (Nil!13528) (Cons!13527 (h!14575 (_ BitVec 64)) (t!19846 List!13531)) )
))
(declare-fun arrayNoDuplicates!0 (array!40807 (_ BitVec 32) List!13531) Bool)

(assert (=> b!720267 (= res!482630 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13528))))

(declare-fun b!720268 () Bool)

(declare-fun lt!319732 () SeekEntryResult!7129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720268 (= e!403976 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19529 a!3186) j!159) a!3186 mask!3328) lt!319732))))

(declare-fun b!720269 () Bool)

(declare-fun e!403974 () Bool)

(assert (=> b!720269 (= e!403972 e!403974)))

(declare-fun res!482629 () Bool)

(assert (=> b!720269 (=> (not res!482629) (not e!403974))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720269 (= res!482629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19529 a!3186) j!159) mask!3328) (select (arr!19529 a!3186) j!159) a!3186 mask!3328) lt!319732))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720269 (= lt!319732 (Intermediate!7129 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720270 () Bool)

(declare-fun res!482626 () Bool)

(assert (=> b!720270 (=> (not res!482626) (not e!403974))))

(assert (=> b!720270 (= res!482626 e!403976)))

(declare-fun c!79189 () Bool)

(assert (=> b!720270 (= c!79189 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720271 () Bool)

(declare-fun res!482625 () Bool)

(assert (=> b!720271 (=> (not res!482625) (not e!403975))))

(assert (=> b!720271 (= res!482625 (and (= (size!19950 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19950 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19950 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720263 () Bool)

(declare-fun res!482624 () Bool)

(assert (=> b!720263 (=> (not res!482624) (not e!403972))))

(assert (=> b!720263 (= res!482624 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19950 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19950 a!3186))))))

(declare-fun res!482619 () Bool)

(assert (=> start!64112 (=> (not res!482619) (not e!403975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64112 (= res!482619 (validMask!0 mask!3328))))

(assert (=> start!64112 e!403975))

(assert (=> start!64112 true))

(declare-fun array_inv!15325 (array!40807) Bool)

(assert (=> start!64112 (array_inv!15325 a!3186)))

(declare-fun b!720272 () Bool)

(declare-fun res!482620 () Bool)

(assert (=> b!720272 (=> (not res!482620) (not e!403974))))

(assert (=> b!720272 (= res!482620 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19529 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720273 () Bool)

(assert (=> b!720273 (= e!403974 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(assert (= (and start!64112 res!482619) b!720271))

(assert (= (and b!720271 res!482625) b!720260))

(assert (= (and b!720260 res!482627) b!720261))

(assert (= (and b!720261 res!482621) b!720266))

(assert (= (and b!720266 res!482623) b!720265))

(assert (= (and b!720265 res!482622) b!720264))

(assert (= (and b!720264 res!482628) b!720267))

(assert (= (and b!720267 res!482630) b!720263))

(assert (= (and b!720263 res!482624) b!720269))

(assert (= (and b!720269 res!482629) b!720272))

(assert (= (and b!720272 res!482620) b!720270))

(assert (= (and b!720270 c!79189) b!720268))

(assert (= (and b!720270 (not c!79189)) b!720262))

(assert (= (and b!720270 res!482626) b!720273))

(declare-fun m!675471 () Bool)

(assert (=> b!720261 m!675471))

(declare-fun m!675473 () Bool)

(assert (=> b!720269 m!675473))

(assert (=> b!720269 m!675473))

(declare-fun m!675475 () Bool)

(assert (=> b!720269 m!675475))

(assert (=> b!720269 m!675475))

(assert (=> b!720269 m!675473))

(declare-fun m!675477 () Bool)

(assert (=> b!720269 m!675477))

(declare-fun m!675479 () Bool)

(assert (=> b!720272 m!675479))

(assert (=> b!720260 m!675473))

(assert (=> b!720260 m!675473))

(declare-fun m!675481 () Bool)

(assert (=> b!720260 m!675481))

(assert (=> b!720262 m!675473))

(assert (=> b!720262 m!675473))

(declare-fun m!675483 () Bool)

(assert (=> b!720262 m!675483))

(declare-fun m!675485 () Bool)

(assert (=> b!720265 m!675485))

(declare-fun m!675487 () Bool)

(assert (=> b!720267 m!675487))

(declare-fun m!675489 () Bool)

(assert (=> b!720266 m!675489))

(declare-fun m!675491 () Bool)

(assert (=> b!720264 m!675491))

(declare-fun m!675493 () Bool)

(assert (=> start!64112 m!675493))

(declare-fun m!675495 () Bool)

(assert (=> start!64112 m!675495))

(assert (=> b!720268 m!675473))

(assert (=> b!720268 m!675473))

(declare-fun m!675497 () Bool)

(assert (=> b!720268 m!675497))

(push 1)

(assert (not start!64112))

(assert (not b!720267))

(assert (not b!720261))

(assert (not b!720269))

(assert (not b!720265))

(assert (not b!720266))

(assert (not b!720260))

(assert (not b!720262))

(assert (not b!720264))

(assert (not b!720268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99109 () Bool)

(declare-fun res!482650 () Bool)

(declare-fun e!404002 () Bool)

(assert (=> d!99109 (=> res!482650 e!404002)))

(assert (=> d!99109 (= res!482650 (bvsge #b00000000000000000000000000000000 (size!19950 a!3186)))))

(assert (=> d!99109 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13528) e!404002)))

(declare-fun b!720304 () Bool)

(declare-fun e!404003 () Bool)

(declare-fun e!404000 () Bool)

(assert (=> b!720304 (= e!404003 e!404000)))

(declare-fun c!79195 () Bool)

(assert (=> b!720304 (= c!79195 (validKeyInArray!0 (select (arr!19529 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34752 () Bool)

(declare-fun call!34755 () Bool)

(assert (=> bm!34752 (= call!34755 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79195 (Cons!13527 (select (arr!19529 a!3186) #b00000000000000000000000000000000) Nil!13528) Nil!13528)))))

(declare-fun b!720305 () Bool)

(assert (=> b!720305 (= e!404000 call!34755)))

(declare-fun b!720306 () Bool)

(assert (=> b!720306 (= e!404002 e!404003)))

(declare-fun res!482651 () Bool)

(assert (=> b!720306 (=> (not res!482651) (not e!404003))))

(declare-fun e!404001 () Bool)

(assert (=> b!720306 (= res!482651 (not e!404001))))

(declare-fun res!482649 () Bool)

(assert (=> b!720306 (=> (not res!482649) (not e!404001))))

(assert (=> b!720306 (= res!482649 (validKeyInArray!0 (select (arr!19529 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720307 () Bool)

(assert (=> b!720307 (= e!404000 call!34755)))

(declare-fun b!720308 () Bool)

(declare-fun contains!4041 (List!13531 (_ BitVec 64)) Bool)

(assert (=> b!720308 (= e!404001 (contains!4041 Nil!13528 (select (arr!19529 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99109 (not res!482650)) b!720306))

(assert (= (and b!720306 res!482649) b!720308))

(assert (= (and b!720306 res!482651) b!720304))

(assert (= (and b!720304 c!79195) b!720305))

(assert (= (and b!720304 (not c!79195)) b!720307))

(assert (= (or b!720305 b!720307) bm!34752))

(declare-fun m!675513 () Bool)

(assert (=> b!720304 m!675513))

(assert (=> b!720304 m!675513))

(declare-fun m!675515 () Bool)

(assert (=> b!720304 m!675515))

(assert (=> bm!34752 m!675513))

(declare-fun m!675517 () Bool)

(assert (=> bm!34752 m!675517))

(assert (=> b!720306 m!675513))

(assert (=> b!720306 m!675513))

(assert (=> b!720306 m!675515))

(assert (=> b!720308 m!675513))

(assert (=> b!720308 m!675513))

(declare-fun m!675519 () Bool)

(assert (=> b!720308 m!675519))

(assert (=> b!720267 d!99109))

(declare-fun d!99111 () Bool)

(assert (=> d!99111 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64112 d!99111))

(declare-fun d!99121 () Bool)

(assert (=> d!99121 (= (array_inv!15325 a!3186) (bvsge (size!19950 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64112 d!99121))

(declare-fun b!720382 () Bool)

(declare-fun e!404043 () SeekEntryResult!7129)

(assert (=> b!720382 (= e!404043 Undefined!7129)))

(declare-fun b!720383 () Bool)

(declare-fun e!404044 () SeekEntryResult!7129)

(assert (=> b!720383 (= e!404043 e!404044)))

(declare-fun lt!319774 () (_ BitVec 64))

(declare-fun c!79231 () Bool)

(assert (=> b!720383 (= c!79231 (= lt!319774 (select (arr!19529 a!3186) j!159)))))

(declare-fun b!720384 () Bool)

(declare-fun e!404045 () SeekEntryResult!7129)

(assert (=> b!720384 (= e!404045 (MissingVacant!7129 resIntermediateIndex!5))))

(declare-fun b!720385 () Bool)

(declare-fun c!79230 () Bool)

(assert (=> b!720385 (= c!79230 (= lt!319774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720385 (= e!404044 e!404045)))

(declare-fun lt!319775 () SeekEntryResult!7129)

(declare-fun d!99123 () Bool)

(assert (=> d!99123 (and (or (is-Undefined!7129 lt!319775) (not (is-Found!7129 lt!319775)) (and (bvsge (index!30885 lt!319775) #b00000000000000000000000000000000) (bvslt (index!30885 lt!319775) (size!19950 a!3186)))) (or (is-Undefined!7129 lt!319775) (is-Found!7129 lt!319775) (not (is-MissingVacant!7129 lt!319775)) (not (= (index!30887 lt!319775) resIntermediateIndex!5)) (and (bvsge (index!30887 lt!319775) #b00000000000000000000000000000000) (bvslt (index!30887 lt!319775) (size!19950 a!3186)))) (or (is-Undefined!7129 lt!319775) (ite (is-Found!7129 lt!319775) (= (select (arr!19529 a!3186) (index!30885 lt!319775)) (select (arr!19529 a!3186) j!159)) (and (is-MissingVacant!7129 lt!319775) (= (index!30887 lt!319775) resIntermediateIndex!5) (= (select (arr!19529 a!3186) (index!30887 lt!319775)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99123 (= lt!319775 e!404043)))

(declare-fun c!79229 () Bool)

(assert (=> d!99123 (= c!79229 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99123 (= lt!319774 (select (arr!19529 a!3186) index!1321))))

(assert (=> d!99123 (validMask!0 mask!3328)))

(assert (=> d!99123 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19529 a!3186) j!159) a!3186 mask!3328) lt!319775)))

(declare-fun b!720386 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720386 (= e!404045 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19529 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720387 () Bool)

(assert (=> b!720387 (= e!404044 (Found!7129 index!1321))))

(assert (= (and d!99123 c!79229) b!720382))

(assert (= (and d!99123 (not c!79229)) b!720383))

(assert (= (and b!720383 c!79231) b!720387))

(assert (= (and b!720383 (not c!79231)) b!720385))

(assert (= (and b!720385 c!79230) b!720384))

(assert (= (and b!720385 (not c!79230)) b!720386))

(declare-fun m!675553 () Bool)

(assert (=> d!99123 m!675553))

(declare-fun m!675555 () Bool)

(assert (=> d!99123 m!675555))

(declare-fun m!675557 () Bool)

(assert (=> d!99123 m!675557))

(assert (=> d!99123 m!675493))

(declare-fun m!675559 () Bool)

(assert (=> b!720386 m!675559))

(assert (=> b!720386 m!675559))

(assert (=> b!720386 m!675473))

(declare-fun m!675561 () Bool)

(assert (=> b!720386 m!675561))

(assert (=> b!720262 d!99123))

(declare-fun d!99133 () Bool)

(assert (=> d!99133 (= (validKeyInArray!0 (select (arr!19529 a!3186) j!159)) (and (not (= (select (arr!19529 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19529 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720260 d!99133))

(declare-fun d!99135 () Bool)

(assert (=> d!99135 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720261 d!99135))

(declare-fun d!99137 () Bool)

(declare-fun res!482675 () Bool)

(declare-fun e!404062 () Bool)

(assert (=> d!99137 (=> res!482675 e!404062)))

(assert (=> d!99137 (= res!482675 (= (select (arr!19529 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99137 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!404062)))

(declare-fun b!720407 () Bool)

(declare-fun e!404063 () Bool)

(assert (=> b!720407 (= e!404062 e!404063)))

(declare-fun res!482676 () Bool)

(assert (=> b!720407 (=> (not res!482676) (not e!404063))))

(assert (=> b!720407 (= res!482676 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19950 a!3186)))))

(declare-fun b!720408 () Bool)

(assert (=> b!720408 (= e!404063 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99137 (not res!482675)) b!720407))

(assert (= (and b!720407 res!482676) b!720408))

(assert (=> d!99137 m!675513))

