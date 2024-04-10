; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63782 () Bool)

(assert start!63782)

(declare-fun b!717533 () Bool)

(declare-fun e!402836 () Bool)

(declare-fun e!402835 () Bool)

(assert (=> b!717533 (= e!402836 e!402835)))

(declare-fun res!480248 () Bool)

(assert (=> b!717533 (=> (not res!480248) (not e!402835))))

(declare-datatypes ((SeekEntryResult!7054 0))(
  ( (MissingZero!7054 (index!30584 (_ BitVec 32))) (Found!7054 (index!30585 (_ BitVec 32))) (Intermediate!7054 (undefined!7866 Bool) (index!30586 (_ BitVec 32)) (x!61602 (_ BitVec 32))) (Undefined!7054) (MissingVacant!7054 (index!30587 (_ BitVec 32))) )
))
(declare-fun lt!319109 () SeekEntryResult!7054)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717533 (= res!480248 (or (= lt!319109 (MissingZero!7054 i!1173)) (= lt!319109 (MissingVacant!7054 i!1173))))))

(declare-datatypes ((array!40645 0))(
  ( (array!40646 (arr!19454 (Array (_ BitVec 32) (_ BitVec 64))) (size!19875 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40645)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40645 (_ BitVec 32)) SeekEntryResult!7054)

(assert (=> b!717533 (= lt!319109 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717534 () Bool)

(declare-fun res!480252 () Bool)

(assert (=> b!717534 (=> (not res!480252) (not e!402836))))

(declare-fun arrayContainsKey!0 (array!40645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717534 (= res!480252 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717535 () Bool)

(declare-datatypes ((List!13456 0))(
  ( (Nil!13453) (Cons!13452 (h!14497 (_ BitVec 64)) (t!19771 List!13456)) )
))
(declare-fun noDuplicate!1280 (List!13456) Bool)

(assert (=> b!717535 (= e!402835 (not (noDuplicate!1280 Nil!13453)))))

(declare-fun b!717536 () Bool)

(declare-fun res!480251 () Bool)

(assert (=> b!717536 (=> (not res!480251) (not e!402836))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717536 (= res!480251 (and (= (size!19875 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19875 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19875 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717537 () Bool)

(declare-fun res!480250 () Bool)

(assert (=> b!717537 (=> (not res!480250) (not e!402836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717537 (= res!480250 (validKeyInArray!0 (select (arr!19454 a!3186) j!159)))))

(declare-fun b!717538 () Bool)

(declare-fun res!480247 () Bool)

(assert (=> b!717538 (=> (not res!480247) (not e!402835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40645 (_ BitVec 32)) Bool)

(assert (=> b!717538 (= res!480247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717539 () Bool)

(declare-fun res!480253 () Bool)

(assert (=> b!717539 (=> (not res!480253) (not e!402836))))

(assert (=> b!717539 (= res!480253 (validKeyInArray!0 k!2102))))

(declare-fun b!717540 () Bool)

(declare-fun res!480249 () Bool)

(assert (=> b!717540 (=> (not res!480249) (not e!402835))))

(assert (=> b!717540 (= res!480249 (and (bvsle #b00000000000000000000000000000000 (size!19875 a!3186)) (bvslt (size!19875 a!3186) #b01111111111111111111111111111111)))))

(declare-fun res!480254 () Bool)

(assert (=> start!63782 (=> (not res!480254) (not e!402836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63782 (= res!480254 (validMask!0 mask!3328))))

(assert (=> start!63782 e!402836))

(declare-fun array_inv!15250 (array!40645) Bool)

(assert (=> start!63782 (array_inv!15250 a!3186)))

(assert (=> start!63782 true))

(assert (= (and start!63782 res!480254) b!717536))

(assert (= (and b!717536 res!480251) b!717537))

(assert (= (and b!717537 res!480250) b!717539))

(assert (= (and b!717539 res!480253) b!717534))

(assert (= (and b!717534 res!480252) b!717533))

(assert (= (and b!717533 res!480248) b!717538))

(assert (= (and b!717538 res!480247) b!717540))

(assert (= (and b!717540 res!480249) b!717535))

(declare-fun m!673411 () Bool)

(assert (=> b!717534 m!673411))

(declare-fun m!673413 () Bool)

(assert (=> b!717533 m!673413))

(declare-fun m!673415 () Bool)

(assert (=> b!717539 m!673415))

(declare-fun m!673417 () Bool)

(assert (=> b!717538 m!673417))

(declare-fun m!673419 () Bool)

(assert (=> start!63782 m!673419))

(declare-fun m!673421 () Bool)

(assert (=> start!63782 m!673421))

(declare-fun m!673423 () Bool)

(assert (=> b!717537 m!673423))

(assert (=> b!717537 m!673423))

(declare-fun m!673425 () Bool)

(assert (=> b!717537 m!673425))

(declare-fun m!673427 () Bool)

(assert (=> b!717535 m!673427))

(push 1)

(assert (not b!717533))

(assert (not b!717538))

(assert (not b!717539))

(assert (not b!717537))

(assert (not b!717534))

(assert (not b!717535))

(assert (not start!63782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98847 () Bool)

(declare-fun res!480259 () Bool)

(declare-fun e!402841 () Bool)

(assert (=> d!98847 (=> res!480259 e!402841)))

(assert (=> d!98847 (= res!480259 (is-Nil!13453 Nil!13453))))

(assert (=> d!98847 (= (noDuplicate!1280 Nil!13453) e!402841)))

(declare-fun b!717545 () Bool)

(declare-fun e!402842 () Bool)

(assert (=> b!717545 (= e!402841 e!402842)))

(declare-fun res!480260 () Bool)

(assert (=> b!717545 (=> (not res!480260) (not e!402842))))

(declare-fun contains!4031 (List!13456 (_ BitVec 64)) Bool)

(assert (=> b!717545 (= res!480260 (not (contains!4031 (t!19771 Nil!13453) (h!14497 Nil!13453))))))

(declare-fun b!717546 () Bool)

(assert (=> b!717546 (= e!402842 (noDuplicate!1280 (t!19771 Nil!13453)))))

(assert (= (and d!98847 (not res!480259)) b!717545))

(assert (= (and b!717545 res!480260) b!717546))

(declare-fun m!673429 () Bool)

(assert (=> b!717545 m!673429))

(declare-fun m!673431 () Bool)

(assert (=> b!717546 m!673431))

(assert (=> b!717535 d!98847))

(declare-fun d!98849 () Bool)

(assert (=> d!98849 (= (validKeyInArray!0 (select (arr!19454 a!3186) j!159)) (and (not (= (select (arr!19454 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19454 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717537 d!98849))

(declare-fun d!98853 () Bool)

(declare-fun lt!319125 () SeekEntryResult!7054)

(assert (=> d!98853 (and (or (is-Undefined!7054 lt!319125) (not (is-Found!7054 lt!319125)) (and (bvsge (index!30585 lt!319125) #b00000000000000000000000000000000) (bvslt (index!30585 lt!319125) (size!19875 a!3186)))) (or (is-Undefined!7054 lt!319125) (is-Found!7054 lt!319125) (not (is-MissingZero!7054 lt!319125)) (and (bvsge (index!30584 lt!319125) #b00000000000000000000000000000000) (bvslt (index!30584 lt!319125) (size!19875 a!3186)))) (or (is-Undefined!7054 lt!319125) (is-Found!7054 lt!319125) (is-MissingZero!7054 lt!319125) (not (is-MissingVacant!7054 lt!319125)) (and (bvsge (index!30587 lt!319125) #b00000000000000000000000000000000) (bvslt (index!30587 lt!319125) (size!19875 a!3186)))) (or (is-Undefined!7054 lt!319125) (ite (is-Found!7054 lt!319125) (= (select (arr!19454 a!3186) (index!30585 lt!319125)) k!2102) (ite (is-MissingZero!7054 lt!319125) (= (select (arr!19454 a!3186) (index!30584 lt!319125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7054 lt!319125) (= (select (arr!19454 a!3186) (index!30587 lt!319125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!402865 () SeekEntryResult!7054)

(assert (=> d!98853 (= lt!319125 e!402865)))

(declare-fun c!79020 () Bool)

(declare-fun lt!319127 () SeekEntryResult!7054)

(assert (=> d!98853 (= c!79020 (and (is-Intermediate!7054 lt!319127) (undefined!7866 lt!319127)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40645 (_ BitVec 32)) SeekEntryResult!7054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98853 (= lt!319127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98853 (validMask!0 mask!3328)))

(assert (=> d!98853 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319125)))

(declare-fun b!717577 () Bool)

(declare-fun e!402864 () SeekEntryResult!7054)

(assert (=> b!717577 (= e!402864 (Found!7054 (index!30586 lt!319127)))))

(declare-fun b!717578 () Bool)

(declare-fun c!79019 () Bool)

(declare-fun lt!319126 () (_ BitVec 64))

(assert (=> b!717578 (= c!79019 (= lt!319126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402866 () SeekEntryResult!7054)

(assert (=> b!717578 (= e!402864 e!402866)))

(declare-fun b!717579 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40645 (_ BitVec 32)) SeekEntryResult!7054)

(assert (=> b!717579 (= e!402866 (seekKeyOrZeroReturnVacant!0 (x!61602 lt!319127) (index!30586 lt!319127) (index!30586 lt!319127) k!2102 a!3186 mask!3328))))

(declare-fun b!717580 () Bool)

(assert (=> b!717580 (= e!402866 (MissingZero!7054 (index!30586 lt!319127)))))

(declare-fun b!717581 () Bool)

(assert (=> b!717581 (= e!402865 Undefined!7054)))

(declare-fun b!717582 () Bool)

(assert (=> b!717582 (= e!402865 e!402864)))

(assert (=> b!717582 (= lt!319126 (select (arr!19454 a!3186) (index!30586 lt!319127)))))

(declare-fun c!79021 () Bool)

(assert (=> b!717582 (= c!79021 (= lt!319126 k!2102))))

(assert (= (and d!98853 c!79020) b!717581))

(assert (= (and d!98853 (not c!79020)) b!717582))

(assert (= (and b!717582 c!79021) b!717577))

(assert (= (and b!717582 (not c!79021)) b!717578))

(assert (= (and b!717578 c!79019) b!717580))

(assert (= (and b!717578 (not c!79019)) b!717579))

(declare-fun m!673447 () Bool)

(assert (=> d!98853 m!673447))

(declare-fun m!673449 () Bool)

(assert (=> d!98853 m!673449))

(assert (=> d!98853 m!673419))

(declare-fun m!673451 () Bool)

(assert (=> d!98853 m!673451))

(assert (=> d!98853 m!673447))

(declare-fun m!673453 () Bool)

(assert (=> d!98853 m!673453))

(declare-fun m!673455 () Bool)

(assert (=> d!98853 m!673455))

(declare-fun m!673457 () Bool)

(assert (=> b!717579 m!673457))

(declare-fun m!673459 () Bool)

(assert (=> b!717582 m!673459))

(assert (=> b!717533 d!98853))

(declare-fun b!717591 () Bool)

(declare-fun e!402875 () Bool)

(declare-fun call!34701 () Bool)

(assert (=> b!717591 (= e!402875 call!34701)))

(declare-fun bm!34698 () Bool)

(assert (=> bm!34698 (= call!34701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717592 () Bool)

(declare-fun e!402874 () Bool)

(assert (=> b!717592 (= e!402874 e!402875)))

(declare-fun c!79024 () Bool)

(assert (=> b!717592 (= c!79024 (validKeyInArray!0 (select (arr!19454 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98865 () Bool)

(declare-fun res!480277 () Bool)

(assert (=> d!98865 (=> res!480277 e!402874)))

(assert (=> d!98865 (= res!480277 (bvsge #b00000000000000000000000000000000 (size!19875 a!3186)))))

(assert (=> d!98865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402874)))

(declare-fun b!717593 () Bool)

(declare-fun e!402873 () Bool)

(assert (=> b!717593 (= e!402875 e!402873)))

(declare-fun lt!319134 () (_ BitVec 64))

(assert (=> b!717593 (= lt!319134 (select (arr!19454 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24648 0))(
  ( (Unit!24649) )
))
(declare-fun lt!319136 () Unit!24648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40645 (_ BitVec 64) (_ BitVec 32)) Unit!24648)

(assert (=> b!717593 (= lt!319136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319134 #b00000000000000000000000000000000))))

(assert (=> b!717593 (arrayContainsKey!0 a!3186 lt!319134 #b00000000000000000000000000000000)))

(declare-fun lt!319135 () Unit!24648)

(assert (=> b!717593 (= lt!319135 lt!319136)))

(declare-fun res!480278 () Bool)

(assert (=> b!717593 (= res!480278 (= (seekEntryOrOpen!0 (select (arr!19454 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7054 #b00000000000000000000000000000000)))))

(assert (=> b!717593 (=> (not res!480278) (not e!402873))))

(declare-fun b!717594 () Bool)

(assert (=> b!717594 (= e!402873 call!34701)))

(assert (= (and d!98865 (not res!480277)) b!717592))

(assert (= (and b!717592 c!79024) b!717593))

(assert (= (and b!717592 (not c!79024)) b!717591))

(assert (= (and b!717593 res!480278) b!717594))

(assert (= (or b!717594 b!717591) bm!34698))

(declare-fun m!673461 () Bool)

(assert (=> bm!34698 m!673461))

(declare-fun m!673463 () Bool)

(assert (=> b!717592 m!673463))

(assert (=> b!717592 m!673463))

(declare-fun m!673465 () Bool)

(assert (=> b!717592 m!673465))

(assert (=> b!717593 m!673463))

(declare-fun m!673467 () Bool)

(assert (=> b!717593 m!673467))

(declare-fun m!673469 () Bool)

(assert (=> b!717593 m!673469))

(assert (=> b!717593 m!673463))

(declare-fun m!673471 () Bool)

(assert (=> b!717593 m!673471))

(assert (=> b!717538 d!98865))

(declare-fun d!98867 () Bool)

(declare-fun res!480283 () Bool)

(declare-fun e!402880 () Bool)

(assert (=> d!98867 (=> res!480283 e!402880)))

(assert (=> d!98867 (= res!480283 (= (select (arr!19454 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98867 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402880)))

(declare-fun b!717599 () Bool)

(declare-fun e!402881 () Bool)

(assert (=> b!717599 (= e!402880 e!402881)))

(declare-fun res!480284 () Bool)

(assert (=> b!717599 (=> (not res!480284) (not e!402881))))

(assert (=> b!717599 (= res!480284 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19875 a!3186)))))

(declare-fun b!717600 () Bool)

(assert (=> b!717600 (= e!402881 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98867 (not res!480283)) b!717599))

(assert (= (and b!717599 res!480284) b!717600))

(assert (=> d!98867 m!673463))

(declare-fun m!673473 () Bool)

(assert (=> b!717600 m!673473))

(assert (=> b!717534 d!98867))

(declare-fun d!98869 () Bool)

(assert (=> d!98869 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717539 d!98869))

(declare-fun d!98871 () Bool)

(assert (=> d!98871 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63782 d!98871))

(declare-fun d!98873 () Bool)

(assert (=> d!98873 (= (array_inv!15250 a!3186) (bvsge (size!19875 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63782 d!98873))

(push 1)

(assert (not b!717593))

(assert (not b!717579))

(assert (not b!717545))

(assert (not bm!34698))

(assert (not b!717546))

(assert (not d!98853))

(assert (not b!717600))

(assert (not b!717592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

