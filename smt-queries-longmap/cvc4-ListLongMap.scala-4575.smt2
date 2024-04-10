; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63830 () Bool)

(assert start!63830)

(declare-fun b!717747 () Bool)

(declare-fun res!480394 () Bool)

(declare-fun e!402961 () Bool)

(assert (=> b!717747 (=> (not res!480394) (not e!402961))))

(declare-datatypes ((array!40654 0))(
  ( (array!40655 (arr!19457 (Array (_ BitVec 32) (_ BitVec 64))) (size!19878 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40654)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717747 (= res!480394 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717748 () Bool)

(declare-fun e!402960 () Bool)

(declare-datatypes ((List!13459 0))(
  ( (Nil!13456) (Cons!13455 (h!14500 (_ BitVec 64)) (t!19774 List!13459)) )
))
(declare-fun contains!4034 (List!13459 (_ BitVec 64)) Bool)

(assert (=> b!717748 (= e!402960 (contains!4034 Nil!13456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717749 () Bool)

(declare-fun e!402962 () Bool)

(assert (=> b!717749 (= e!402961 e!402962)))

(declare-fun res!480390 () Bool)

(assert (=> b!717749 (=> (not res!480390) (not e!402962))))

(declare-datatypes ((SeekEntryResult!7057 0))(
  ( (MissingZero!7057 (index!30596 (_ BitVec 32))) (Found!7057 (index!30597 (_ BitVec 32))) (Intermediate!7057 (undefined!7869 Bool) (index!30598 (_ BitVec 32)) (x!61613 (_ BitVec 32))) (Undefined!7057) (MissingVacant!7057 (index!30599 (_ BitVec 32))) )
))
(declare-fun lt!319172 () SeekEntryResult!7057)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717749 (= res!480390 (or (= lt!319172 (MissingZero!7057 i!1173)) (= lt!319172 (MissingVacant!7057 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40654 (_ BitVec 32)) SeekEntryResult!7057)

(assert (=> b!717749 (= lt!319172 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717750 () Bool)

(declare-fun res!480398 () Bool)

(assert (=> b!717750 (=> (not res!480398) (not e!402962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40654 (_ BitVec 32)) Bool)

(assert (=> b!717750 (= res!480398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480392 () Bool)

(assert (=> start!63830 (=> (not res!480392) (not e!402961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63830 (= res!480392 (validMask!0 mask!3328))))

(assert (=> start!63830 e!402961))

(declare-fun array_inv!15253 (array!40654) Bool)

(assert (=> start!63830 (array_inv!15253 a!3186)))

(assert (=> start!63830 true))

(declare-fun b!717751 () Bool)

(declare-fun res!480396 () Bool)

(assert (=> b!717751 (=> (not res!480396) (not e!402962))))

(assert (=> b!717751 (= res!480396 (and (bvsle #b00000000000000000000000000000000 (size!19878 a!3186)) (bvslt (size!19878 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717752 () Bool)

(declare-fun res!480389 () Bool)

(assert (=> b!717752 (=> (not res!480389) (not e!402962))))

(declare-fun noDuplicate!1283 (List!13459) Bool)

(assert (=> b!717752 (= res!480389 (noDuplicate!1283 Nil!13456))))

(declare-fun b!717753 () Bool)

(declare-fun res!480391 () Bool)

(assert (=> b!717753 (=> (not res!480391) (not e!402961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717753 (= res!480391 (validKeyInArray!0 k!2102))))

(declare-fun b!717754 () Bool)

(declare-fun res!480395 () Bool)

(assert (=> b!717754 (=> (not res!480395) (not e!402961))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717754 (= res!480395 (and (= (size!19878 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19878 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19878 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717755 () Bool)

(declare-fun res!480393 () Bool)

(assert (=> b!717755 (=> (not res!480393) (not e!402961))))

(assert (=> b!717755 (= res!480393 (validKeyInArray!0 (select (arr!19457 a!3186) j!159)))))

(declare-fun b!717756 () Bool)

(assert (=> b!717756 (= e!402962 e!402960)))

(declare-fun res!480397 () Bool)

(assert (=> b!717756 (=> res!480397 e!402960)))

(assert (=> b!717756 (= res!480397 (contains!4034 Nil!13456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63830 res!480392) b!717754))

(assert (= (and b!717754 res!480395) b!717755))

(assert (= (and b!717755 res!480393) b!717753))

(assert (= (and b!717753 res!480391) b!717747))

(assert (= (and b!717747 res!480394) b!717749))

(assert (= (and b!717749 res!480390) b!717750))

(assert (= (and b!717750 res!480398) b!717751))

(assert (= (and b!717751 res!480396) b!717752))

(assert (= (and b!717752 res!480389) b!717756))

(assert (= (and b!717756 (not res!480397)) b!717748))

(declare-fun m!673569 () Bool)

(assert (=> b!717755 m!673569))

(assert (=> b!717755 m!673569))

(declare-fun m!673571 () Bool)

(assert (=> b!717755 m!673571))

(declare-fun m!673573 () Bool)

(assert (=> b!717747 m!673573))

(declare-fun m!673575 () Bool)

(assert (=> start!63830 m!673575))

(declare-fun m!673577 () Bool)

(assert (=> start!63830 m!673577))

(declare-fun m!673579 () Bool)

(assert (=> b!717756 m!673579))

(declare-fun m!673581 () Bool)

(assert (=> b!717749 m!673581))

(declare-fun m!673583 () Bool)

(assert (=> b!717752 m!673583))

(declare-fun m!673585 () Bool)

(assert (=> b!717748 m!673585))

(declare-fun m!673587 () Bool)

(assert (=> b!717750 m!673587))

(declare-fun m!673589 () Bool)

(assert (=> b!717753 m!673589))

(push 1)

(assert (not b!717749))

(assert (not b!717747))

(assert (not b!717752))

(assert (not start!63830))

(assert (not b!717753))

(assert (not b!717756))

(assert (not b!717748))

(assert (not b!717750))

(assert (not b!717755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98903 () Bool)

(assert (=> d!98903 (= (validKeyInArray!0 (select (arr!19457 a!3186) j!159)) (and (not (= (select (arr!19457 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19457 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717755 d!98903))

(declare-fun b!717813 () Bool)

(declare-fun e!403011 () SeekEntryResult!7057)

(declare-fun lt!319195 () SeekEntryResult!7057)

(assert (=> b!717813 (= e!403011 (Found!7057 (index!30598 lt!319195)))))

(declare-fun b!717814 () Bool)

(declare-fun e!403010 () SeekEntryResult!7057)

(assert (=> b!717814 (= e!403010 (MissingZero!7057 (index!30598 lt!319195)))))

(declare-fun b!717815 () Bool)

(declare-fun e!403012 () SeekEntryResult!7057)

(assert (=> b!717815 (= e!403012 Undefined!7057)))

(declare-fun b!717816 () Bool)

(declare-fun c!79055 () Bool)

(declare-fun lt!319196 () (_ BitVec 64))

(assert (=> b!717816 (= c!79055 (= lt!319196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717816 (= e!403011 e!403010)))

(declare-fun b!717817 () Bool)

(assert (=> b!717817 (= e!403012 e!403011)))

(assert (=> b!717817 (= lt!319196 (select (arr!19457 a!3186) (index!30598 lt!319195)))))

(declare-fun c!79057 () Bool)

(assert (=> b!717817 (= c!79057 (= lt!319196 k!2102))))

(declare-fun d!98905 () Bool)

(declare-fun lt!319197 () SeekEntryResult!7057)

(assert (=> d!98905 (and (or (is-Undefined!7057 lt!319197) (not (is-Found!7057 lt!319197)) (and (bvsge (index!30597 lt!319197) #b00000000000000000000000000000000) (bvslt (index!30597 lt!319197) (size!19878 a!3186)))) (or (is-Undefined!7057 lt!319197) (is-Found!7057 lt!319197) (not (is-MissingZero!7057 lt!319197)) (and (bvsge (index!30596 lt!319197) #b00000000000000000000000000000000) (bvslt (index!30596 lt!319197) (size!19878 a!3186)))) (or (is-Undefined!7057 lt!319197) (is-Found!7057 lt!319197) (is-MissingZero!7057 lt!319197) (not (is-MissingVacant!7057 lt!319197)) (and (bvsge (index!30599 lt!319197) #b00000000000000000000000000000000) (bvslt (index!30599 lt!319197) (size!19878 a!3186)))) (or (is-Undefined!7057 lt!319197) (ite (is-Found!7057 lt!319197) (= (select (arr!19457 a!3186) (index!30597 lt!319197)) k!2102) (ite (is-MissingZero!7057 lt!319197) (= (select (arr!19457 a!3186) (index!30596 lt!319197)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7057 lt!319197) (= (select (arr!19457 a!3186) (index!30599 lt!319197)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98905 (= lt!319197 e!403012)))

(declare-fun c!79056 () Bool)

(assert (=> d!98905 (= c!79056 (and (is-Intermediate!7057 lt!319195) (undefined!7869 lt!319195)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40654 (_ BitVec 32)) SeekEntryResult!7057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98905 (= lt!319195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98905 (validMask!0 mask!3328)))

(assert (=> d!98905 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319197)))

(declare-fun b!717818 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40654 (_ BitVec 32)) SeekEntryResult!7057)

(assert (=> b!717818 (= e!403010 (seekKeyOrZeroReturnVacant!0 (x!61613 lt!319195) (index!30598 lt!319195) (index!30598 lt!319195) k!2102 a!3186 mask!3328))))

(assert (= (and d!98905 c!79056) b!717815))

(assert (= (and d!98905 (not c!79056)) b!717817))

(assert (= (and b!717817 c!79057) b!717813))

(assert (= (and b!717817 (not c!79057)) b!717816))

(assert (= (and b!717816 c!79055) b!717814))

(assert (= (and b!717816 (not c!79055)) b!717818))

(declare-fun m!673629 () Bool)

(assert (=> b!717817 m!673629))

(declare-fun m!673631 () Bool)

(assert (=> d!98905 m!673631))

(declare-fun m!673633 () Bool)

(assert (=> d!98905 m!673633))

(assert (=> d!98905 m!673631))

(declare-fun m!673635 () Bool)

(assert (=> d!98905 m!673635))

(declare-fun m!673637 () Bool)

(assert (=> d!98905 m!673637))

(assert (=> d!98905 m!673575))

(declare-fun m!673639 () Bool)

(assert (=> d!98905 m!673639))

(declare-fun m!673641 () Bool)

(assert (=> b!717818 m!673641))

(assert (=> b!717749 d!98905))

(declare-fun d!98929 () Bool)

(declare-fun lt!319206 () Bool)

(declare-fun content!378 (List!13459) (Set (_ BitVec 64)))

(assert (=> d!98929 (= lt!319206 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!378 Nil!13456)))))

(declare-fun e!403023 () Bool)

(assert (=> d!98929 (= lt!319206 e!403023)))

(declare-fun res!480446 () Bool)

(assert (=> d!98929 (=> (not res!480446) (not e!403023))))

(assert (=> d!98929 (= res!480446 (is-Cons!13455 Nil!13456))))

(assert (=> d!98929 (= (contains!4034 Nil!13456 #b0000000000000000000000000000000000000000000000000000000000000000) lt!319206)))

(declare-fun b!717831 () Bool)

(declare-fun e!403024 () Bool)

(assert (=> b!717831 (= e!403023 e!403024)))

(declare-fun res!480445 () Bool)

(assert (=> b!717831 (=> res!480445 e!403024)))

(assert (=> b!717831 (= res!480445 (= (h!14500 Nil!13456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!717832 () Bool)

(assert (=> b!717832 (= e!403024 (contains!4034 (t!19774 Nil!13456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98929 res!480446) b!717831))

(assert (= (and b!717831 (not res!480445)) b!717832))

(declare-fun m!673643 () Bool)

(assert (=> d!98929 m!673643))

(declare-fun m!673645 () Bool)

(assert (=> d!98929 m!673645))

(declare-fun m!673647 () Bool)

(assert (=> b!717832 m!673647))

(assert (=> b!717756 d!98929))

(declare-fun d!98931 () Bool)

(declare-fun res!480459 () Bool)

(declare-fun e!403040 () Bool)

(assert (=> d!98931 (=> res!480459 e!403040)))

(assert (=> d!98931 (= res!480459 (bvsge #b00000000000000000000000000000000 (size!19878 a!3186)))))

(assert (=> d!98931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403040)))

(declare-fun b!717851 () Bool)

(declare-fun e!403042 () Bool)

(declare-fun e!403041 () Bool)

(assert (=> b!717851 (= e!403042 e!403041)))

(declare-fun lt!319216 () (_ BitVec 64))

(assert (=> b!717851 (= lt!319216 (select (arr!19457 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24658 0))(
  ( (Unit!24659) )
))
(declare-fun lt!319218 () Unit!24658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40654 (_ BitVec 64) (_ BitVec 32)) Unit!24658)

(assert (=> b!717851 (= lt!319218 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319216 #b00000000000000000000000000000000))))

(assert (=> b!717851 (arrayContainsKey!0 a!3186 lt!319216 #b00000000000000000000000000000000)))

(declare-fun lt!319217 () Unit!24658)

(assert (=> b!717851 (= lt!319217 lt!319218)))

(declare-fun res!480460 () Bool)

(assert (=> b!717851 (= res!480460 (= (seekEntryOrOpen!0 (select (arr!19457 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7057 #b00000000000000000000000000000000)))))

(assert (=> b!717851 (=> (not res!480460) (not e!403041))))

(declare-fun b!717852 () Bool)

(declare-fun call!34713 () Bool)

(assert (=> b!717852 (= e!403042 call!34713)))

(declare-fun bm!34710 () Bool)

(assert (=> bm!34710 (= call!34713 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717853 () Bool)

(assert (=> b!717853 (= e!403040 e!403042)))

(declare-fun c!79063 () Bool)

(assert (=> b!717853 (= c!79063 (validKeyInArray!0 (select (arr!19457 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717854 () Bool)

(assert (=> b!717854 (= e!403041 call!34713)))

(assert (= (and d!98931 (not res!480459)) b!717853))

(assert (= (and b!717853 c!79063) b!717851))

(assert (= (and b!717853 (not c!79063)) b!717852))

