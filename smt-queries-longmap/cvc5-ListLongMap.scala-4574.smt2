; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63778 () Bool)

(assert start!63778)

(declare-fun b!717485 () Bool)

(declare-fun res!480200 () Bool)

(declare-fun e!402817 () Bool)

(assert (=> b!717485 (=> (not res!480200) (not e!402817))))

(declare-datatypes ((array!40641 0))(
  ( (array!40642 (arr!19452 (Array (_ BitVec 32) (_ BitVec 64))) (size!19873 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40641)

(assert (=> b!717485 (= res!480200 (and (bvsle #b00000000000000000000000000000000 (size!19873 a!3186)) (bvslt (size!19873 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717486 () Bool)

(declare-fun res!480203 () Bool)

(declare-fun e!402816 () Bool)

(assert (=> b!717486 (=> (not res!480203) (not e!402816))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717486 (= res!480203 (validKeyInArray!0 (select (arr!19452 a!3186) j!159)))))

(declare-fun b!717487 () Bool)

(declare-fun res!480204 () Bool)

(assert (=> b!717487 (=> (not res!480204) (not e!402816))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717487 (= res!480204 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717488 () Bool)

(declare-fun res!480206 () Bool)

(assert (=> b!717488 (=> (not res!480206) (not e!402816))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717488 (= res!480206 (and (= (size!19873 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19873 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19873 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480201 () Bool)

(assert (=> start!63778 (=> (not res!480201) (not e!402816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63778 (= res!480201 (validMask!0 mask!3328))))

(assert (=> start!63778 e!402816))

(declare-fun array_inv!15248 (array!40641) Bool)

(assert (=> start!63778 (array_inv!15248 a!3186)))

(assert (=> start!63778 true))

(declare-fun b!717489 () Bool)

(declare-fun res!480202 () Bool)

(assert (=> b!717489 (=> (not res!480202) (not e!402816))))

(assert (=> b!717489 (= res!480202 (validKeyInArray!0 k!2102))))

(declare-fun b!717490 () Bool)

(assert (=> b!717490 (= e!402816 e!402817)))

(declare-fun res!480199 () Bool)

(assert (=> b!717490 (=> (not res!480199) (not e!402817))))

(declare-datatypes ((SeekEntryResult!7052 0))(
  ( (MissingZero!7052 (index!30576 (_ BitVec 32))) (Found!7052 (index!30577 (_ BitVec 32))) (Intermediate!7052 (undefined!7864 Bool) (index!30578 (_ BitVec 32)) (x!61600 (_ BitVec 32))) (Undefined!7052) (MissingVacant!7052 (index!30579 (_ BitVec 32))) )
))
(declare-fun lt!319103 () SeekEntryResult!7052)

(assert (=> b!717490 (= res!480199 (or (= lt!319103 (MissingZero!7052 i!1173)) (= lt!319103 (MissingVacant!7052 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40641 (_ BitVec 32)) SeekEntryResult!7052)

(assert (=> b!717490 (= lt!319103 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717491 () Bool)

(declare-datatypes ((List!13454 0))(
  ( (Nil!13451) (Cons!13450 (h!14495 (_ BitVec 64)) (t!19769 List!13454)) )
))
(declare-fun noDuplicate!1278 (List!13454) Bool)

(assert (=> b!717491 (= e!402817 (not (noDuplicate!1278 Nil!13451)))))

(declare-fun b!717492 () Bool)

(declare-fun res!480205 () Bool)

(assert (=> b!717492 (=> (not res!480205) (not e!402817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40641 (_ BitVec 32)) Bool)

(assert (=> b!717492 (= res!480205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63778 res!480201) b!717488))

(assert (= (and b!717488 res!480206) b!717486))

(assert (= (and b!717486 res!480203) b!717489))

(assert (= (and b!717489 res!480202) b!717487))

(assert (= (and b!717487 res!480204) b!717490))

(assert (= (and b!717490 res!480199) b!717492))

(assert (= (and b!717492 res!480205) b!717485))

(assert (= (and b!717485 res!480200) b!717491))

(declare-fun m!673375 () Bool)

(assert (=> b!717487 m!673375))

(declare-fun m!673377 () Bool)

(assert (=> b!717489 m!673377))

(declare-fun m!673379 () Bool)

(assert (=> b!717490 m!673379))

(declare-fun m!673381 () Bool)

(assert (=> b!717491 m!673381))

(declare-fun m!673383 () Bool)

(assert (=> b!717492 m!673383))

(declare-fun m!673385 () Bool)

(assert (=> b!717486 m!673385))

(assert (=> b!717486 m!673385))

(declare-fun m!673387 () Bool)

(assert (=> b!717486 m!673387))

(declare-fun m!673389 () Bool)

(assert (=> start!63778 m!673389))

(declare-fun m!673391 () Bool)

(assert (=> start!63778 m!673391))

(push 1)

(assert (not b!717487))

(assert (not b!717491))

(assert (not b!717489))

(assert (not b!717486))

(assert (not b!717492))

(assert (not start!63778))

(assert (not b!717490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98843 () Bool)

(assert (=> d!98843 (= (validKeyInArray!0 (select (arr!19452 a!3186) j!159)) (and (not (= (select (arr!19452 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19452 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717486 d!98843))

(declare-fun bm!34695 () Bool)

(declare-fun call!34698 () Bool)

(assert (=> bm!34695 (= call!34698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717555 () Bool)

(declare-fun e!402851 () Bool)

(declare-fun e!402850 () Bool)

(assert (=> b!717555 (= e!402851 e!402850)))

(declare-fun c!79012 () Bool)

(assert (=> b!717555 (= c!79012 (validKeyInArray!0 (select (arr!19452 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98845 () Bool)

(declare-fun res!480266 () Bool)

(assert (=> d!98845 (=> res!480266 e!402851)))

(assert (=> d!98845 (= res!480266 (bvsge #b00000000000000000000000000000000 (size!19873 a!3186)))))

(assert (=> d!98845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402851)))

(declare-fun b!717556 () Bool)

(declare-fun e!402849 () Bool)

(assert (=> b!717556 (= e!402850 e!402849)))

(declare-fun lt!319117 () (_ BitVec 64))

(assert (=> b!717556 (= lt!319117 (select (arr!19452 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24650 0))(
  ( (Unit!24651) )
))
(declare-fun lt!319118 () Unit!24650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40641 (_ BitVec 64) (_ BitVec 32)) Unit!24650)

(assert (=> b!717556 (= lt!319118 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319117 #b00000000000000000000000000000000))))

(assert (=> b!717556 (arrayContainsKey!0 a!3186 lt!319117 #b00000000000000000000000000000000)))

(declare-fun lt!319116 () Unit!24650)

(assert (=> b!717556 (= lt!319116 lt!319118)))

(declare-fun res!480265 () Bool)

(assert (=> b!717556 (= res!480265 (= (seekEntryOrOpen!0 (select (arr!19452 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7052 #b00000000000000000000000000000000)))))

(assert (=> b!717556 (=> (not res!480265) (not e!402849))))

(declare-fun b!717557 () Bool)

(assert (=> b!717557 (= e!402850 call!34698)))

(declare-fun b!717558 () Bool)

(assert (=> b!717558 (= e!402849 call!34698)))

(assert (= (and d!98845 (not res!480266)) b!717555))

(assert (= (and b!717555 c!79012) b!717556))

(assert (= (and b!717555 (not c!79012)) b!717557))

(assert (= (and b!717556 res!480265) b!717558))

(assert (= (or b!717558 b!717557) bm!34695))

(declare-fun m!673433 () Bool)

(assert (=> bm!34695 m!673433))

(declare-fun m!673435 () Bool)

(assert (=> b!717555 m!673435))

(assert (=> b!717555 m!673435))

(declare-fun m!673437 () Bool)

(assert (=> b!717555 m!673437))

(assert (=> b!717556 m!673435))

(declare-fun m!673439 () Bool)

(assert (=> b!717556 m!673439))

(declare-fun m!673441 () Bool)

(assert (=> b!717556 m!673441))

(assert (=> b!717556 m!673435))

(declare-fun m!673443 () Bool)

(assert (=> b!717556 m!673443))

(assert (=> b!717492 d!98845))

(declare-fun d!98857 () Bool)

(declare-fun res!480271 () Bool)

(declare-fun e!402856 () Bool)

(assert (=> d!98857 (=> res!480271 e!402856)))

(assert (=> d!98857 (= res!480271 (= (select (arr!19452 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98857 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402856)))

(declare-fun b!717563 () Bool)

(declare-fun e!402857 () Bool)

(assert (=> b!717563 (= e!402856 e!402857)))

(declare-fun res!480272 () Bool)

(assert (=> b!717563 (=> (not res!480272) (not e!402857))))

(assert (=> b!717563 (= res!480272 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19873 a!3186)))))

(declare-fun b!717564 () Bool)

(assert (=> b!717564 (= e!402857 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98857 (not res!480271)) b!717563))

(assert (= (and b!717563 res!480272) b!717564))

(assert (=> d!98857 m!673435))

(declare-fun m!673445 () Bool)

(assert (=> b!717564 m!673445))

(assert (=> b!717487 d!98857))

(declare-fun b!717625 () Bool)

(declare-fun c!79038 () Bool)

(declare-fun lt!319150 () (_ BitVec 64))

(assert (=> b!717625 (= c!79038 (= lt!319150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402895 () SeekEntryResult!7052)

(declare-fun e!402894 () SeekEntryResult!7052)

(assert (=> b!717625 (= e!402895 e!402894)))

(declare-fun b!717626 () Bool)

(declare-fun lt!319149 () SeekEntryResult!7052)

(assert (=> b!717626 (= e!402894 (MissingZero!7052 (index!30578 lt!319149)))))

(declare-fun d!98859 () Bool)

(declare-fun lt!319151 () SeekEntryResult!7052)

(assert (=> d!98859 (and (or (is-Undefined!7052 lt!319151) (not (is-Found!7052 lt!319151)) (and (bvsge (index!30577 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30577 lt!319151) (size!19873 a!3186)))) (or (is-Undefined!7052 lt!319151) (is-Found!7052 lt!319151) (not (is-MissingZero!7052 lt!319151)) (and (bvsge (index!30576 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30576 lt!319151) (size!19873 a!3186)))) (or (is-Undefined!7052 lt!319151) (is-Found!7052 lt!319151) (is-MissingZero!7052 lt!319151) (not (is-MissingVacant!7052 lt!319151)) (and (bvsge (index!30579 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30579 lt!319151) (size!19873 a!3186)))) (or (is-Undefined!7052 lt!319151) (ite (is-Found!7052 lt!319151) (= (select (arr!19452 a!3186) (index!30577 lt!319151)) k!2102) (ite (is-MissingZero!7052 lt!319151) (= (select (arr!19452 a!3186) (index!30576 lt!319151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7052 lt!319151) (= (select (arr!19452 a!3186) (index!30579 lt!319151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!402896 () SeekEntryResult!7052)

(assert (=> d!98859 (= lt!319151 e!402896)))

(declare-fun c!79037 () Bool)

(assert (=> d!98859 (= c!79037 (and (is-Intermediate!7052 lt!319149) (undefined!7864 lt!319149)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40641 (_ BitVec 32)) SeekEntryResult!7052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98859 (= lt!319149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98859 (validMask!0 mask!3328)))

(assert (=> d!98859 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319151)))

(declare-fun b!717627 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40641 (_ BitVec 32)) SeekEntryResult!7052)

(assert (=> b!717627 (= e!402894 (seekKeyOrZeroReturnVacant!0 (x!61600 lt!319149) (index!30578 lt!319149) (index!30578 lt!319149) k!2102 a!3186 mask!3328))))

(declare-fun b!717628 () Bool)

(assert (=> b!717628 (= e!402895 (Found!7052 (index!30578 lt!319149)))))

(declare-fun b!717629 () Bool)

(assert (=> b!717629 (= e!402896 Undefined!7052)))

(declare-fun b!717630 () Bool)

(assert (=> b!717630 (= e!402896 e!402895)))

(assert (=> b!717630 (= lt!319150 (select (arr!19452 a!3186) (index!30578 lt!319149)))))

(declare-fun c!79039 () Bool)

(assert (=> b!717630 (= c!79039 (= lt!319150 k!2102))))

(assert (= (and d!98859 c!79037) b!717629))

(assert (= (and d!98859 (not c!79037)) b!717630))

(assert (= (and b!717630 c!79039) b!717628))

(assert (= (and b!717630 (not c!79039)) b!717625))

(assert (= (and b!717625 c!79038) b!717626))

(assert (= (and b!717625 (not c!79038)) b!717627))

(declare-fun m!673475 () Bool)

(assert (=> d!98859 m!673475))

(declare-fun m!673477 () Bool)

(assert (=> d!98859 m!673477))

(assert (=> d!98859 m!673389))

(declare-fun m!673479 () Bool)

(assert (=> d!98859 m!673479))

(declare-fun m!673481 () Bool)

(assert (=> d!98859 m!673481))

(assert (=> d!98859 m!673475))

(declare-fun m!673483 () Bool)

(assert (=> d!98859 m!673483))

(declare-fun m!673485 () Bool)

(assert (=> b!717627 m!673485))

(declare-fun m!673487 () Bool)

(assert (=> b!717630 m!673487))

(assert (=> b!717490 d!98859))

(declare-fun d!98875 () Bool)

