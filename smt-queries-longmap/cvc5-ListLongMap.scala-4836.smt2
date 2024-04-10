; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66488 () Bool)

(assert start!66488)

(declare-fun res!518582 () Bool)

(declare-fun e!426798 () Bool)

(assert (=> start!66488 (=> (not res!518582) (not e!426798))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66488 (= res!518582 (validMask!0 mask!3328))))

(assert (=> start!66488 e!426798))

(assert (=> start!66488 true))

(declare-datatypes ((array!42267 0))(
  ( (array!42268 (arr!20238 (Array (_ BitVec 32) (_ BitVec 64))) (size!20659 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42267)

(declare-fun array_inv!16034 (array!42267) Bool)

(assert (=> start!66488 (array_inv!16034 a!3186)))

(declare-fun b!766439 () Bool)

(declare-fun res!518569 () Bool)

(declare-fun e!426803 () Bool)

(assert (=> b!766439 (=> (not res!518569) (not e!426803))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766439 (= res!518569 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20659 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20659 a!3186))))))

(declare-fun b!766440 () Bool)

(declare-fun res!518580 () Bool)

(declare-fun e!426804 () Bool)

(assert (=> b!766440 (=> (not res!518580) (not e!426804))))

(declare-fun e!426797 () Bool)

(assert (=> b!766440 (= res!518580 e!426797)))

(declare-fun c!84325 () Bool)

(assert (=> b!766440 (= c!84325 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766441 () Bool)

(assert (=> b!766441 (= e!426803 e!426804)))

(declare-fun res!518570 () Bool)

(assert (=> b!766441 (=> (not res!518570) (not e!426804))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7838 0))(
  ( (MissingZero!7838 (index!33720 (_ BitVec 32))) (Found!7838 (index!33721 (_ BitVec 32))) (Intermediate!7838 (undefined!8650 Bool) (index!33722 (_ BitVec 32)) (x!64628 (_ BitVec 32))) (Undefined!7838) (MissingVacant!7838 (index!33723 (_ BitVec 32))) )
))
(declare-fun lt!340945 () SeekEntryResult!7838)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42267 (_ BitVec 32)) SeekEntryResult!7838)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766441 (= res!518570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!340945))))

(assert (=> b!766441 (= lt!340945 (Intermediate!7838 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766442 () Bool)

(assert (=> b!766442 (= e!426798 e!426803)))

(declare-fun res!518577 () Bool)

(assert (=> b!766442 (=> (not res!518577) (not e!426803))))

(declare-fun lt!340943 () SeekEntryResult!7838)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766442 (= res!518577 (or (= lt!340943 (MissingZero!7838 i!1173)) (= lt!340943 (MissingVacant!7838 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42267 (_ BitVec 32)) SeekEntryResult!7838)

(assert (=> b!766442 (= lt!340943 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766443 () Bool)

(declare-fun res!518572 () Bool)

(assert (=> b!766443 (=> (not res!518572) (not e!426803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42267 (_ BitVec 32)) Bool)

(assert (=> b!766443 (= res!518572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766444 () Bool)

(declare-fun res!518573 () Bool)

(assert (=> b!766444 (=> (not res!518573) (not e!426798))))

(declare-fun arrayContainsKey!0 (array!42267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766444 (= res!518573 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766445 () Bool)

(declare-fun res!518584 () Bool)

(assert (=> b!766445 (=> (not res!518584) (not e!426798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766445 (= res!518584 (validKeyInArray!0 (select (arr!20238 a!3186) j!159)))))

(declare-fun b!766446 () Bool)

(declare-fun res!518575 () Bool)

(assert (=> b!766446 (=> (not res!518575) (not e!426804))))

(assert (=> b!766446 (= res!518575 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20238 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766447 () Bool)

(declare-fun e!426796 () Bool)

(declare-fun e!426795 () Bool)

(assert (=> b!766447 (= e!426796 e!426795)))

(declare-fun res!518579 () Bool)

(assert (=> b!766447 (=> (not res!518579) (not e!426795))))

(declare-fun lt!340941 () SeekEntryResult!7838)

(assert (=> b!766447 (= res!518579 (= (seekEntryOrOpen!0 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!340941))))

(assert (=> b!766447 (= lt!340941 (Found!7838 j!159))))

(declare-fun b!766448 () Bool)

(declare-fun res!518576 () Bool)

(assert (=> b!766448 (=> (not res!518576) (not e!426798))))

(assert (=> b!766448 (= res!518576 (and (= (size!20659 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20659 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20659 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766449 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42267 (_ BitVec 32)) SeekEntryResult!7838)

(assert (=> b!766449 (= e!426795 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!340941))))

(declare-fun b!766450 () Bool)

(declare-fun e!426801 () Bool)

(declare-fun e!426800 () Bool)

(assert (=> b!766450 (= e!426801 (not e!426800))))

(declare-fun res!518578 () Bool)

(assert (=> b!766450 (=> res!518578 e!426800)))

(declare-fun lt!340938 () SeekEntryResult!7838)

(assert (=> b!766450 (= res!518578 (or (not (is-Intermediate!7838 lt!340938)) (bvsge x!1131 (x!64628 lt!340938))))))

(assert (=> b!766450 e!426796))

(declare-fun res!518574 () Bool)

(assert (=> b!766450 (=> (not res!518574) (not e!426796))))

(assert (=> b!766450 (= res!518574 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26402 0))(
  ( (Unit!26403) )
))
(declare-fun lt!340939 () Unit!26402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26402)

(assert (=> b!766450 (= lt!340939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766451 () Bool)

(assert (=> b!766451 (= e!426797 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) (Found!7838 j!159)))))

(declare-fun e!426802 () Bool)

(declare-fun b!766452 () Bool)

(declare-fun lt!340946 () (_ BitVec 32))

(assert (=> b!766452 (= e!426802 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340946 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!340945))))

(declare-fun b!766453 () Bool)

(assert (=> b!766453 (= e!426804 e!426801)))

(declare-fun res!518581 () Bool)

(assert (=> b!766453 (=> (not res!518581) (not e!426801))))

(declare-fun lt!340940 () SeekEntryResult!7838)

(assert (=> b!766453 (= res!518581 (= lt!340940 lt!340938))))

(declare-fun lt!340944 () (_ BitVec 64))

(declare-fun lt!340942 () array!42267)

(assert (=> b!766453 (= lt!340938 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340944 lt!340942 mask!3328))))

(assert (=> b!766453 (= lt!340940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340944 mask!3328) lt!340944 lt!340942 mask!3328))))

(assert (=> b!766453 (= lt!340944 (select (store (arr!20238 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766453 (= lt!340942 (array!42268 (store (arr!20238 a!3186) i!1173 k!2102) (size!20659 a!3186)))))

(declare-fun b!766454 () Bool)

(assert (=> b!766454 (= e!426797 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!340945))))

(declare-fun b!766455 () Bool)

(assert (=> b!766455 (= e!426800 e!426802)))

(declare-fun res!518571 () Bool)

(assert (=> b!766455 (=> res!518571 e!426802)))

(assert (=> b!766455 (= res!518571 (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766455 (= lt!340946 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766456 () Bool)

(declare-fun res!518583 () Bool)

(assert (=> b!766456 (=> (not res!518583) (not e!426803))))

(declare-datatypes ((List!14240 0))(
  ( (Nil!14237) (Cons!14236 (h!15326 (_ BitVec 64)) (t!20555 List!14240)) )
))
(declare-fun arrayNoDuplicates!0 (array!42267 (_ BitVec 32) List!14240) Bool)

(assert (=> b!766456 (= res!518583 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14237))))

(declare-fun b!766457 () Bool)

(declare-fun res!518568 () Bool)

(assert (=> b!766457 (=> (not res!518568) (not e!426798))))

(assert (=> b!766457 (= res!518568 (validKeyInArray!0 k!2102))))

(assert (= (and start!66488 res!518582) b!766448))

(assert (= (and b!766448 res!518576) b!766445))

(assert (= (and b!766445 res!518584) b!766457))

(assert (= (and b!766457 res!518568) b!766444))

(assert (= (and b!766444 res!518573) b!766442))

(assert (= (and b!766442 res!518577) b!766443))

(assert (= (and b!766443 res!518572) b!766456))

(assert (= (and b!766456 res!518583) b!766439))

(assert (= (and b!766439 res!518569) b!766441))

(assert (= (and b!766441 res!518570) b!766446))

(assert (= (and b!766446 res!518575) b!766440))

(assert (= (and b!766440 c!84325) b!766454))

(assert (= (and b!766440 (not c!84325)) b!766451))

(assert (= (and b!766440 res!518580) b!766453))

(assert (= (and b!766453 res!518581) b!766450))

(assert (= (and b!766450 res!518574) b!766447))

(assert (= (and b!766447 res!518579) b!766449))

(assert (= (and b!766450 (not res!518578)) b!766455))

(assert (= (and b!766455 (not res!518571)) b!766452))

(declare-fun m!712425 () Bool)

(assert (=> b!766443 m!712425))

(declare-fun m!712427 () Bool)

(assert (=> b!766450 m!712427))

(declare-fun m!712429 () Bool)

(assert (=> b!766450 m!712429))

(declare-fun m!712431 () Bool)

(assert (=> b!766456 m!712431))

(declare-fun m!712433 () Bool)

(assert (=> b!766445 m!712433))

(assert (=> b!766445 m!712433))

(declare-fun m!712435 () Bool)

(assert (=> b!766445 m!712435))

(declare-fun m!712437 () Bool)

(assert (=> b!766446 m!712437))

(assert (=> b!766452 m!712433))

(assert (=> b!766452 m!712433))

(declare-fun m!712439 () Bool)

(assert (=> b!766452 m!712439))

(assert (=> b!766449 m!712433))

(assert (=> b!766449 m!712433))

(declare-fun m!712441 () Bool)

(assert (=> b!766449 m!712441))

(declare-fun m!712443 () Bool)

(assert (=> b!766444 m!712443))

(assert (=> b!766454 m!712433))

(assert (=> b!766454 m!712433))

(declare-fun m!712445 () Bool)

(assert (=> b!766454 m!712445))

(declare-fun m!712447 () Bool)

(assert (=> start!66488 m!712447))

(declare-fun m!712449 () Bool)

(assert (=> start!66488 m!712449))

(assert (=> b!766451 m!712433))

(assert (=> b!766451 m!712433))

(declare-fun m!712451 () Bool)

(assert (=> b!766451 m!712451))

(declare-fun m!712453 () Bool)

(assert (=> b!766453 m!712453))

(declare-fun m!712455 () Bool)

(assert (=> b!766453 m!712455))

(declare-fun m!712457 () Bool)

(assert (=> b!766453 m!712457))

(declare-fun m!712459 () Bool)

(assert (=> b!766453 m!712459))

(declare-fun m!712461 () Bool)

(assert (=> b!766453 m!712461))

(assert (=> b!766453 m!712453))

(assert (=> b!766441 m!712433))

(assert (=> b!766441 m!712433))

(declare-fun m!712463 () Bool)

(assert (=> b!766441 m!712463))

(assert (=> b!766441 m!712463))

(assert (=> b!766441 m!712433))

(declare-fun m!712465 () Bool)

(assert (=> b!766441 m!712465))

(assert (=> b!766447 m!712433))

(assert (=> b!766447 m!712433))

(declare-fun m!712467 () Bool)

(assert (=> b!766447 m!712467))

(declare-fun m!712469 () Bool)

(assert (=> b!766442 m!712469))

(declare-fun m!712471 () Bool)

(assert (=> b!766457 m!712471))

(declare-fun m!712473 () Bool)

(assert (=> b!766455 m!712473))

(push 1)

(assert (not b!766457))

(assert (not b!766444))

(assert (not b!766454))

(assert (not b!766453))

(assert (not b!766456))

(assert (not b!766445))

(assert (not start!66488))

(assert (not b!766443))

(assert (not b!766447))

(assert (not b!766441))

(assert (not b!766451))

(assert (not b!766450))

(assert (not b!766449))

(assert (not b!766442))

(assert (not b!766452))

(assert (not b!766455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101227 () Bool)

(assert (=> d!101227 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66488 d!101227))

(declare-fun d!101231 () Bool)

(assert (=> d!101231 (= (array_inv!16034 a!3186) (bvsge (size!20659 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66488 d!101231))

(declare-fun b!766656 () Bool)

(declare-fun e!426919 () SeekEntryResult!7838)

(assert (=> b!766656 (= e!426919 Undefined!7838)))

(declare-fun d!101233 () Bool)

(declare-fun lt!341023 () SeekEntryResult!7838)

(assert (=> d!101233 (and (or (is-Undefined!7838 lt!341023) (not (is-Found!7838 lt!341023)) (and (bvsge (index!33721 lt!341023) #b00000000000000000000000000000000) (bvslt (index!33721 lt!341023) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341023) (is-Found!7838 lt!341023) (not (is-MissingZero!7838 lt!341023)) (and (bvsge (index!33720 lt!341023) #b00000000000000000000000000000000) (bvslt (index!33720 lt!341023) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341023) (is-Found!7838 lt!341023) (is-MissingZero!7838 lt!341023) (not (is-MissingVacant!7838 lt!341023)) (and (bvsge (index!33723 lt!341023) #b00000000000000000000000000000000) (bvslt (index!33723 lt!341023) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341023) (ite (is-Found!7838 lt!341023) (= (select (arr!20238 a!3186) (index!33721 lt!341023)) (select (arr!20238 a!3186) j!159)) (ite (is-MissingZero!7838 lt!341023) (= (select (arr!20238 a!3186) (index!33720 lt!341023)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7838 lt!341023) (= (select (arr!20238 a!3186) (index!33723 lt!341023)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101233 (= lt!341023 e!426919)))

(declare-fun c!84360 () Bool)

(declare-fun lt!341022 () SeekEntryResult!7838)

(assert (=> d!101233 (= c!84360 (and (is-Intermediate!7838 lt!341022) (undefined!8650 lt!341022)))))

(assert (=> d!101233 (= lt!341022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101233 (validMask!0 mask!3328)))

(assert (=> d!101233 (= (seekEntryOrOpen!0 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341023)))

(declare-fun b!766657 () Bool)

(declare-fun e!426920 () SeekEntryResult!7838)

(assert (=> b!766657 (= e!426919 e!426920)))

(declare-fun lt!341024 () (_ BitVec 64))

(assert (=> b!766657 (= lt!341024 (select (arr!20238 a!3186) (index!33722 lt!341022)))))

(declare-fun c!84361 () Bool)

(assert (=> b!766657 (= c!84361 (= lt!341024 (select (arr!20238 a!3186) j!159)))))

(declare-fun b!766658 () Bool)

(declare-fun e!426921 () SeekEntryResult!7838)

(assert (=> b!766658 (= e!426921 (MissingZero!7838 (index!33722 lt!341022)))))

(declare-fun b!766659 () Bool)

(assert (=> b!766659 (= e!426921 (seekKeyOrZeroReturnVacant!0 (x!64628 lt!341022) (index!33722 lt!341022) (index!33722 lt!341022) (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766660 () Bool)

(assert (=> b!766660 (= e!426920 (Found!7838 (index!33722 lt!341022)))))

(declare-fun b!766661 () Bool)

(declare-fun c!84359 () Bool)

(assert (=> b!766661 (= c!84359 (= lt!341024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766661 (= e!426920 e!426921)))

(assert (= (and d!101233 c!84360) b!766656))

(assert (= (and d!101233 (not c!84360)) b!766657))

(assert (= (and b!766657 c!84361) b!766660))

(assert (= (and b!766657 (not c!84361)) b!766661))

(assert (= (and b!766661 c!84359) b!766658))

(assert (= (and b!766661 (not c!84359)) b!766659))

(declare-fun m!712603 () Bool)

(assert (=> d!101233 m!712603))

(assert (=> d!101233 m!712433))

(assert (=> d!101233 m!712463))

(assert (=> d!101233 m!712463))

(assert (=> d!101233 m!712433))

(assert (=> d!101233 m!712465))

(assert (=> d!101233 m!712447))

(declare-fun m!712605 () Bool)

(assert (=> d!101233 m!712605))

(declare-fun m!712607 () Bool)

(assert (=> d!101233 m!712607))

(declare-fun m!712609 () Bool)

(assert (=> b!766657 m!712609))

(assert (=> b!766659 m!712433))

(declare-fun m!712611 () Bool)

(assert (=> b!766659 m!712611))

(assert (=> b!766447 d!101233))

(declare-fun e!426951 () SeekEntryResult!7838)

(declare-fun b!766716 () Bool)

(assert (=> b!766716 (= e!426951 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341045 () SeekEntryResult!7838)

(declare-fun d!101247 () Bool)

(assert (=> d!101247 (and (or (is-Undefined!7838 lt!341045) (not (is-Found!7838 lt!341045)) (and (bvsge (index!33721 lt!341045) #b00000000000000000000000000000000) (bvslt (index!33721 lt!341045) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341045) (is-Found!7838 lt!341045) (not (is-MissingVacant!7838 lt!341045)) (not (= (index!33723 lt!341045) resIntermediateIndex!5)) (and (bvsge (index!33723 lt!341045) #b00000000000000000000000000000000) (bvslt (index!33723 lt!341045) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341045) (ite (is-Found!7838 lt!341045) (= (select (arr!20238 a!3186) (index!33721 lt!341045)) (select (arr!20238 a!3186) j!159)) (and (is-MissingVacant!7838 lt!341045) (= (index!33723 lt!341045) resIntermediateIndex!5) (= (select (arr!20238 a!3186) (index!33723 lt!341045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426952 () SeekEntryResult!7838)

(assert (=> d!101247 (= lt!341045 e!426952)))

(declare-fun c!84386 () Bool)

(assert (=> d!101247 (= c!84386 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!341044 () (_ BitVec 64))

(assert (=> d!101247 (= lt!341044 (select (arr!20238 a!3186) resIntermediateIndex!5))))

(assert (=> d!101247 (validMask!0 mask!3328)))

(assert (=> d!101247 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341045)))

(declare-fun b!766717 () Bool)

(assert (=> b!766717 (= e!426951 (MissingVacant!7838 resIntermediateIndex!5))))

(declare-fun b!766718 () Bool)

(assert (=> b!766718 (= e!426952 Undefined!7838)))

(declare-fun b!766719 () Bool)

(declare-fun e!426950 () SeekEntryResult!7838)

(assert (=> b!766719 (= e!426950 (Found!7838 resIntermediateIndex!5))))

(declare-fun b!766720 () Bool)

(declare-fun c!84387 () Bool)

(assert (=> b!766720 (= c!84387 (= lt!341044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766720 (= e!426950 e!426951)))

(declare-fun b!766721 () Bool)

(assert (=> b!766721 (= e!426952 e!426950)))

(declare-fun c!84388 () Bool)

(assert (=> b!766721 (= c!84388 (= lt!341044 (select (arr!20238 a!3186) j!159)))))

(assert (= (and d!101247 c!84386) b!766718))

(assert (= (and d!101247 (not c!84386)) b!766721))

(assert (= (and b!766721 c!84388) b!766719))

(assert (= (and b!766721 (not c!84388)) b!766720))

(assert (= (and b!766720 c!84387) b!766717))

(assert (= (and b!766720 (not c!84387)) b!766716))

(declare-fun m!712635 () Bool)

(assert (=> b!766716 m!712635))

(assert (=> b!766716 m!712635))

(assert (=> b!766716 m!712433))

(declare-fun m!712637 () Bool)

(assert (=> b!766716 m!712637))

(declare-fun m!712639 () Bool)

(assert (=> d!101247 m!712639))

(declare-fun m!712641 () Bool)

(assert (=> d!101247 m!712641))

(assert (=> d!101247 m!712437))

(assert (=> d!101247 m!712447))

(assert (=> b!766449 d!101247))

(declare-fun d!101253 () Bool)

(assert (=> d!101253 (= (validKeyInArray!0 (select (arr!20238 a!3186) j!159)) (and (not (= (select (arr!20238 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20238 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766445 d!101253))

(declare-fun b!766762 () Bool)

(declare-fun e!426980 () Bool)

(declare-fun e!426982 () Bool)

(assert (=> b!766762 (= e!426980 e!426982)))

(declare-fun c!84400 () Bool)

(assert (=> b!766762 (= c!84400 (validKeyInArray!0 (select (arr!20238 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35049 () Bool)

(declare-fun call!35052 () Bool)

(assert (=> bm!35049 (= call!35052 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84400 (Cons!14236 (select (arr!20238 a!3186) #b00000000000000000000000000000000) Nil!14237) Nil!14237)))))

(declare-fun b!766763 () Bool)

(assert (=> b!766763 (= e!426982 call!35052)))

(declare-fun b!766764 () Bool)

(declare-fun e!426983 () Bool)

(declare-fun contains!4082 (List!14240 (_ BitVec 64)) Bool)

(assert (=> b!766764 (= e!426983 (contains!4082 Nil!14237 (select (arr!20238 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101255 () Bool)

(declare-fun res!518743 () Bool)

(declare-fun e!426981 () Bool)

(assert (=> d!101255 (=> res!518743 e!426981)))

(assert (=> d!101255 (= res!518743 (bvsge #b00000000000000000000000000000000 (size!20659 a!3186)))))

(assert (=> d!101255 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14237) e!426981)))

(declare-fun b!766765 () Bool)

(assert (=> b!766765 (= e!426981 e!426980)))

(declare-fun res!518744 () Bool)

(assert (=> b!766765 (=> (not res!518744) (not e!426980))))

(assert (=> b!766765 (= res!518744 (not e!426983))))

(declare-fun res!518742 () Bool)

(assert (=> b!766765 (=> (not res!518742) (not e!426983))))

(assert (=> b!766765 (= res!518742 (validKeyInArray!0 (select (arr!20238 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766766 () Bool)

(assert (=> b!766766 (= e!426982 call!35052)))

(assert (= (and d!101255 (not res!518743)) b!766765))

(assert (= (and b!766765 res!518742) b!766764))

(assert (= (and b!766765 res!518744) b!766762))

(assert (= (and b!766762 c!84400) b!766763))

(assert (= (and b!766762 (not c!84400)) b!766766))

(assert (= (or b!766763 b!766766) bm!35049))

(declare-fun m!712663 () Bool)

(assert (=> b!766762 m!712663))

(assert (=> b!766762 m!712663))

(declare-fun m!712665 () Bool)

(assert (=> b!766762 m!712665))

(assert (=> bm!35049 m!712663))

(declare-fun m!712667 () Bool)

(assert (=> bm!35049 m!712667))

(assert (=> b!766764 m!712663))

(assert (=> b!766764 m!712663))

(declare-fun m!712669 () Bool)

(assert (=> b!766764 m!712669))

(assert (=> b!766765 m!712663))

(assert (=> b!766765 m!712663))

(assert (=> b!766765 m!712665))

(assert (=> b!766456 d!101255))

(declare-fun d!101265 () Bool)

(declare-fun lt!341070 () (_ BitVec 32))

(assert (=> d!101265 (and (bvsge lt!341070 #b00000000000000000000000000000000) (bvslt lt!341070 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101265 (= lt!341070 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101265 (validMask!0 mask!3328)))

(assert (=> d!101265 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341070)))

(declare-fun bs!21509 () Bool)

(assert (= bs!21509 d!101265))

(declare-fun m!712673 () Bool)

(assert (=> bs!21509 m!712673))

(assert (=> bs!21509 m!712447))

(assert (=> b!766455 d!101265))

(declare-fun d!101269 () Bool)

(assert (=> d!101269 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766457 d!101269))

(declare-fun b!766864 () Bool)

(declare-fun e!427044 () SeekEntryResult!7838)

(assert (=> b!766864 (= e!427044 (Intermediate!7838 false index!1321 x!1131))))

(declare-fun b!766865 () Bool)

(declare-fun e!427043 () Bool)

(declare-fun lt!341106 () SeekEntryResult!7838)

(assert (=> b!766865 (= e!427043 (bvsge (x!64628 lt!341106) #b01111111111111111111111111111110))))

(declare-fun b!766866 () Bool)

(assert (=> b!766866 (= e!427044 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340944 lt!340942 mask!3328))))

(declare-fun b!766867 () Bool)

(declare-fun e!427041 () SeekEntryResult!7838)

(assert (=> b!766867 (= e!427041 (Intermediate!7838 true index!1321 x!1131))))

(declare-fun d!101271 () Bool)

(assert (=> d!101271 e!427043))

(declare-fun c!84437 () Bool)

(assert (=> d!101271 (= c!84437 (and (is-Intermediate!7838 lt!341106) (undefined!8650 lt!341106)))))

(assert (=> d!101271 (= lt!341106 e!427041)))

(declare-fun c!84435 () Bool)

(assert (=> d!101271 (= c!84435 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341107 () (_ BitVec 64))

(assert (=> d!101271 (= lt!341107 (select (arr!20238 lt!340942) index!1321))))

(assert (=> d!101271 (validMask!0 mask!3328)))

(assert (=> d!101271 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340944 lt!340942 mask!3328) lt!341106)))

(declare-fun b!766868 () Bool)

(assert (=> b!766868 (and (bvsge (index!33722 lt!341106) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341106) (size!20659 lt!340942)))))

(declare-fun res!518776 () Bool)

(assert (=> b!766868 (= res!518776 (= (select (arr!20238 lt!340942) (index!33722 lt!341106)) lt!340944))))

(declare-fun e!427042 () Bool)

(assert (=> b!766868 (=> res!518776 e!427042)))

(declare-fun e!427045 () Bool)

(assert (=> b!766868 (= e!427045 e!427042)))

(declare-fun b!766869 () Bool)

(assert (=> b!766869 (= e!427041 e!427044)))

(declare-fun c!84436 () Bool)

(assert (=> b!766869 (= c!84436 (or (= lt!341107 lt!340944) (= (bvadd lt!341107 lt!341107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766870 () Bool)

(assert (=> b!766870 (and (bvsge (index!33722 lt!341106) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341106) (size!20659 lt!340942)))))

(assert (=> b!766870 (= e!427042 (= (select (arr!20238 lt!340942) (index!33722 lt!341106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766871 () Bool)

(assert (=> b!766871 (= e!427043 e!427045)))

(declare-fun res!518775 () Bool)

(assert (=> b!766871 (= res!518775 (and (is-Intermediate!7838 lt!341106) (not (undefined!8650 lt!341106)) (bvslt (x!64628 lt!341106) #b01111111111111111111111111111110) (bvsge (x!64628 lt!341106) #b00000000000000000000000000000000) (bvsge (x!64628 lt!341106) x!1131)))))

(assert (=> b!766871 (=> (not res!518775) (not e!427045))))

(declare-fun b!766872 () Bool)

(assert (=> b!766872 (and (bvsge (index!33722 lt!341106) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341106) (size!20659 lt!340942)))))

(declare-fun res!518777 () Bool)

(assert (=> b!766872 (= res!518777 (= (select (arr!20238 lt!340942) (index!33722 lt!341106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766872 (=> res!518777 e!427042)))

(assert (= (and d!101271 c!84435) b!766867))

(assert (= (and d!101271 (not c!84435)) b!766869))

(assert (= (and b!766869 c!84436) b!766864))

(assert (= (and b!766869 (not c!84436)) b!766866))

(assert (= (and d!101271 c!84437) b!766865))

(assert (= (and d!101271 (not c!84437)) b!766871))

(assert (= (and b!766871 res!518775) b!766868))

(assert (= (and b!766868 (not res!518776)) b!766872))

(assert (= (and b!766872 (not res!518777)) b!766870))

(declare-fun m!712739 () Bool)

(assert (=> b!766868 m!712739))

(assert (=> b!766870 m!712739))

(declare-fun m!712741 () Bool)

(assert (=> d!101271 m!712741))

(assert (=> d!101271 m!712447))

(assert (=> b!766866 m!712473))

(assert (=> b!766866 m!712473))

(declare-fun m!712743 () Bool)

(assert (=> b!766866 m!712743))

(assert (=> b!766872 m!712739))

(assert (=> b!766453 d!101271))

(declare-fun b!766873 () Bool)

(declare-fun e!427049 () SeekEntryResult!7838)

(assert (=> b!766873 (= e!427049 (Intermediate!7838 false (toIndex!0 lt!340944 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766874 () Bool)

(declare-fun e!427048 () Bool)

(declare-fun lt!341108 () SeekEntryResult!7838)

(assert (=> b!766874 (= e!427048 (bvsge (x!64628 lt!341108) #b01111111111111111111111111111110))))

(declare-fun b!766875 () Bool)

(assert (=> b!766875 (= e!427049 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340944 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340944 lt!340942 mask!3328))))

(declare-fun b!766876 () Bool)

(declare-fun e!427046 () SeekEntryResult!7838)

(assert (=> b!766876 (= e!427046 (Intermediate!7838 true (toIndex!0 lt!340944 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101295 () Bool)

(assert (=> d!101295 e!427048))

(declare-fun c!84440 () Bool)

(assert (=> d!101295 (= c!84440 (and (is-Intermediate!7838 lt!341108) (undefined!8650 lt!341108)))))

(assert (=> d!101295 (= lt!341108 e!427046)))

(declare-fun c!84438 () Bool)

(assert (=> d!101295 (= c!84438 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341109 () (_ BitVec 64))

(assert (=> d!101295 (= lt!341109 (select (arr!20238 lt!340942) (toIndex!0 lt!340944 mask!3328)))))

(assert (=> d!101295 (validMask!0 mask!3328)))

(assert (=> d!101295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340944 mask!3328) lt!340944 lt!340942 mask!3328) lt!341108)))

(declare-fun b!766877 () Bool)

(assert (=> b!766877 (and (bvsge (index!33722 lt!341108) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341108) (size!20659 lt!340942)))))

(declare-fun res!518779 () Bool)

(assert (=> b!766877 (= res!518779 (= (select (arr!20238 lt!340942) (index!33722 lt!341108)) lt!340944))))

(declare-fun e!427047 () Bool)

(assert (=> b!766877 (=> res!518779 e!427047)))

(declare-fun e!427050 () Bool)

(assert (=> b!766877 (= e!427050 e!427047)))

(declare-fun b!766878 () Bool)

(assert (=> b!766878 (= e!427046 e!427049)))

(declare-fun c!84439 () Bool)

(assert (=> b!766878 (= c!84439 (or (= lt!341109 lt!340944) (= (bvadd lt!341109 lt!341109) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766879 () Bool)

(assert (=> b!766879 (and (bvsge (index!33722 lt!341108) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341108) (size!20659 lt!340942)))))

(assert (=> b!766879 (= e!427047 (= (select (arr!20238 lt!340942) (index!33722 lt!341108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766880 () Bool)

(assert (=> b!766880 (= e!427048 e!427050)))

(declare-fun res!518778 () Bool)

(assert (=> b!766880 (= res!518778 (and (is-Intermediate!7838 lt!341108) (not (undefined!8650 lt!341108)) (bvslt (x!64628 lt!341108) #b01111111111111111111111111111110) (bvsge (x!64628 lt!341108) #b00000000000000000000000000000000) (bvsge (x!64628 lt!341108) #b00000000000000000000000000000000)))))

(assert (=> b!766880 (=> (not res!518778) (not e!427050))))

(declare-fun b!766881 () Bool)

(assert (=> b!766881 (and (bvsge (index!33722 lt!341108) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341108) (size!20659 lt!340942)))))

(declare-fun res!518780 () Bool)

(assert (=> b!766881 (= res!518780 (= (select (arr!20238 lt!340942) (index!33722 lt!341108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766881 (=> res!518780 e!427047)))

(assert (= (and d!101295 c!84438) b!766876))

(assert (= (and d!101295 (not c!84438)) b!766878))

(assert (= (and b!766878 c!84439) b!766873))

(assert (= (and b!766878 (not c!84439)) b!766875))

(assert (= (and d!101295 c!84440) b!766874))

(assert (= (and d!101295 (not c!84440)) b!766880))

(assert (= (and b!766880 res!518778) b!766877))

(assert (= (and b!766877 (not res!518779)) b!766881))

(assert (= (and b!766881 (not res!518780)) b!766879))

(declare-fun m!712745 () Bool)

(assert (=> b!766877 m!712745))

(assert (=> b!766879 m!712745))

(assert (=> d!101295 m!712453))

(declare-fun m!712747 () Bool)

(assert (=> d!101295 m!712747))

(assert (=> d!101295 m!712447))

(assert (=> b!766875 m!712453))

(declare-fun m!712749 () Bool)

(assert (=> b!766875 m!712749))

(assert (=> b!766875 m!712749))

(declare-fun m!712751 () Bool)

(assert (=> b!766875 m!712751))

(assert (=> b!766881 m!712745))

(assert (=> b!766453 d!101295))

(declare-fun d!101297 () Bool)

(declare-fun lt!341124 () (_ BitVec 32))

(declare-fun lt!341123 () (_ BitVec 32))

(assert (=> d!101297 (= lt!341124 (bvmul (bvxor lt!341123 (bvlshr lt!341123 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101297 (= lt!341123 ((_ extract 31 0) (bvand (bvxor lt!340944 (bvlshr lt!340944 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101297 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518781 (let ((h!15331 ((_ extract 31 0) (bvand (bvxor lt!340944 (bvlshr lt!340944 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64640 (bvmul (bvxor h!15331 (bvlshr h!15331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64640 (bvlshr x!64640 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518781 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518781 #b00000000000000000000000000000000))))))

(assert (=> d!101297 (= (toIndex!0 lt!340944 mask!3328) (bvand (bvxor lt!341124 (bvlshr lt!341124 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766453 d!101297))

(declare-fun b!766894 () Bool)

(declare-fun e!427060 () SeekEntryResult!7838)

(assert (=> b!766894 (= e!427060 Undefined!7838)))

(declare-fun d!101299 () Bool)

(declare-fun lt!341126 () SeekEntryResult!7838)

(assert (=> d!101299 (and (or (is-Undefined!7838 lt!341126) (not (is-Found!7838 lt!341126)) (and (bvsge (index!33721 lt!341126) #b00000000000000000000000000000000) (bvslt (index!33721 lt!341126) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341126) (is-Found!7838 lt!341126) (not (is-MissingZero!7838 lt!341126)) (and (bvsge (index!33720 lt!341126) #b00000000000000000000000000000000) (bvslt (index!33720 lt!341126) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341126) (is-Found!7838 lt!341126) (is-MissingZero!7838 lt!341126) (not (is-MissingVacant!7838 lt!341126)) (and (bvsge (index!33723 lt!341126) #b00000000000000000000000000000000) (bvslt (index!33723 lt!341126) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341126) (ite (is-Found!7838 lt!341126) (= (select (arr!20238 a!3186) (index!33721 lt!341126)) k!2102) (ite (is-MissingZero!7838 lt!341126) (= (select (arr!20238 a!3186) (index!33720 lt!341126)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7838 lt!341126) (= (select (arr!20238 a!3186) (index!33723 lt!341126)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101299 (= lt!341126 e!427060)))

(declare-fun c!84445 () Bool)

(declare-fun lt!341125 () SeekEntryResult!7838)

(assert (=> d!101299 (= c!84445 (and (is-Intermediate!7838 lt!341125) (undefined!8650 lt!341125)))))

(assert (=> d!101299 (= lt!341125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101299 (validMask!0 mask!3328)))

(assert (=> d!101299 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341126)))

(declare-fun b!766895 () Bool)

(declare-fun e!427061 () SeekEntryResult!7838)

(assert (=> b!766895 (= e!427060 e!427061)))

(declare-fun lt!341127 () (_ BitVec 64))

(assert (=> b!766895 (= lt!341127 (select (arr!20238 a!3186) (index!33722 lt!341125)))))

(declare-fun c!84446 () Bool)

(assert (=> b!766895 (= c!84446 (= lt!341127 k!2102))))

(declare-fun b!766896 () Bool)

(declare-fun e!427062 () SeekEntryResult!7838)

(assert (=> b!766896 (= e!427062 (MissingZero!7838 (index!33722 lt!341125)))))

(declare-fun b!766897 () Bool)

(assert (=> b!766897 (= e!427062 (seekKeyOrZeroReturnVacant!0 (x!64628 lt!341125) (index!33722 lt!341125) (index!33722 lt!341125) k!2102 a!3186 mask!3328))))

(declare-fun b!766898 () Bool)

(assert (=> b!766898 (= e!427061 (Found!7838 (index!33722 lt!341125)))))

(declare-fun b!766899 () Bool)

(declare-fun c!84444 () Bool)

(assert (=> b!766899 (= c!84444 (= lt!341127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766899 (= e!427061 e!427062)))

(assert (= (and d!101299 c!84445) b!766894))

(assert (= (and d!101299 (not c!84445)) b!766895))

(assert (= (and b!766895 c!84446) b!766898))

(assert (= (and b!766895 (not c!84446)) b!766899))

(assert (= (and b!766899 c!84444) b!766896))

(assert (= (and b!766899 (not c!84444)) b!766897))

(declare-fun m!712761 () Bool)

(assert (=> d!101299 m!712761))

(declare-fun m!712763 () Bool)

(assert (=> d!101299 m!712763))

(assert (=> d!101299 m!712763))

(declare-fun m!712765 () Bool)

(assert (=> d!101299 m!712765))

(assert (=> d!101299 m!712447))

(declare-fun m!712767 () Bool)

(assert (=> d!101299 m!712767))

(declare-fun m!712769 () Bool)

(assert (=> d!101299 m!712769))

(declare-fun m!712771 () Bool)

(assert (=> b!766895 m!712771))

(declare-fun m!712775 () Bool)

(assert (=> b!766897 m!712775))

(assert (=> b!766442 d!101299))

(declare-fun d!101303 () Bool)

(declare-fun res!518792 () Bool)

(declare-fun e!427070 () Bool)

(assert (=> d!101303 (=> res!518792 e!427070)))

(assert (=> d!101303 (= res!518792 (= (select (arr!20238 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101303 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!427070)))

(declare-fun b!766910 () Bool)

(declare-fun e!427071 () Bool)

(assert (=> b!766910 (= e!427070 e!427071)))

(declare-fun res!518793 () Bool)

(assert (=> b!766910 (=> (not res!518793) (not e!427071))))

(assert (=> b!766910 (= res!518793 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20659 a!3186)))))

(declare-fun b!766911 () Bool)

(assert (=> b!766911 (= e!427071 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101303 (not res!518792)) b!766910))

(assert (= (and b!766910 res!518793) b!766911))

(assert (=> d!101303 m!712663))

(declare-fun m!712789 () Bool)

(assert (=> b!766911 m!712789))

(assert (=> b!766444 d!101303))

(declare-fun b!766920 () Bool)

(declare-fun e!427079 () Bool)

(declare-fun call!35062 () Bool)

(assert (=> b!766920 (= e!427079 call!35062)))

(declare-fun d!101311 () Bool)

(declare-fun res!518798 () Bool)

(declare-fun e!427080 () Bool)

(assert (=> d!101311 (=> res!518798 e!427080)))

(assert (=> d!101311 (= res!518798 (bvsge #b00000000000000000000000000000000 (size!20659 a!3186)))))

(assert (=> d!101311 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427080)))

(declare-fun b!766921 () Bool)

(declare-fun e!427078 () Bool)

(assert (=> b!766921 (= e!427080 e!427078)))

(declare-fun c!84452 () Bool)

(assert (=> b!766921 (= c!84452 (validKeyInArray!0 (select (arr!20238 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766922 () Bool)

(assert (=> b!766922 (= e!427078 e!427079)))

(declare-fun lt!341138 () (_ BitVec 64))

(assert (=> b!766922 (= lt!341138 (select (arr!20238 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341137 () Unit!26402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42267 (_ BitVec 64) (_ BitVec 32)) Unit!26402)

(assert (=> b!766922 (= lt!341137 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341138 #b00000000000000000000000000000000))))

(assert (=> b!766922 (arrayContainsKey!0 a!3186 lt!341138 #b00000000000000000000000000000000)))

(declare-fun lt!341139 () Unit!26402)

(assert (=> b!766922 (= lt!341139 lt!341137)))

(declare-fun res!518799 () Bool)

(assert (=> b!766922 (= res!518799 (= (seekEntryOrOpen!0 (select (arr!20238 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7838 #b00000000000000000000000000000000)))))

(assert (=> b!766922 (=> (not res!518799) (not e!427079))))

(declare-fun b!766923 () Bool)

(assert (=> b!766923 (= e!427078 call!35062)))

(declare-fun bm!35059 () Bool)

(assert (=> bm!35059 (= call!35062 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!101311 (not res!518798)) b!766921))

(assert (= (and b!766921 c!84452) b!766922))

(assert (= (and b!766921 (not c!84452)) b!766923))

(assert (= (and b!766922 res!518799) b!766920))

(assert (= (or b!766920 b!766923) bm!35059))

(assert (=> b!766921 m!712663))

(assert (=> b!766921 m!712663))

(assert (=> b!766921 m!712665))

(assert (=> b!766922 m!712663))

(declare-fun m!712791 () Bool)

(assert (=> b!766922 m!712791))

(declare-fun m!712793 () Bool)

(assert (=> b!766922 m!712793))

(assert (=> b!766922 m!712663))

(declare-fun m!712795 () Bool)

(assert (=> b!766922 m!712795))

(declare-fun m!712797 () Bool)

(assert (=> bm!35059 m!712797))

(assert (=> b!766443 d!101311))

(declare-fun b!766924 () Bool)

(declare-fun e!427084 () SeekEntryResult!7838)

(assert (=> b!766924 (= e!427084 (Intermediate!7838 false index!1321 x!1131))))

(declare-fun b!766925 () Bool)

(declare-fun e!427083 () Bool)

(declare-fun lt!341140 () SeekEntryResult!7838)

(assert (=> b!766925 (= e!427083 (bvsge (x!64628 lt!341140) #b01111111111111111111111111111110))))

(declare-fun b!766926 () Bool)

(assert (=> b!766926 (= e!427084 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766927 () Bool)

(declare-fun e!427081 () SeekEntryResult!7838)

(assert (=> b!766927 (= e!427081 (Intermediate!7838 true index!1321 x!1131))))

(declare-fun d!101313 () Bool)

(assert (=> d!101313 e!427083))

(declare-fun c!84455 () Bool)

(assert (=> d!101313 (= c!84455 (and (is-Intermediate!7838 lt!341140) (undefined!8650 lt!341140)))))

(assert (=> d!101313 (= lt!341140 e!427081)))

(declare-fun c!84453 () Bool)

(assert (=> d!101313 (= c!84453 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341141 () (_ BitVec 64))

(assert (=> d!101313 (= lt!341141 (select (arr!20238 a!3186) index!1321))))

(assert (=> d!101313 (validMask!0 mask!3328)))

(assert (=> d!101313 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341140)))

(declare-fun b!766928 () Bool)

(assert (=> b!766928 (and (bvsge (index!33722 lt!341140) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341140) (size!20659 a!3186)))))

(declare-fun res!518801 () Bool)

(assert (=> b!766928 (= res!518801 (= (select (arr!20238 a!3186) (index!33722 lt!341140)) (select (arr!20238 a!3186) j!159)))))

(declare-fun e!427082 () Bool)

(assert (=> b!766928 (=> res!518801 e!427082)))

(declare-fun e!427085 () Bool)

(assert (=> b!766928 (= e!427085 e!427082)))

(declare-fun b!766929 () Bool)

(assert (=> b!766929 (= e!427081 e!427084)))

(declare-fun c!84454 () Bool)

(assert (=> b!766929 (= c!84454 (or (= lt!341141 (select (arr!20238 a!3186) j!159)) (= (bvadd lt!341141 lt!341141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766930 () Bool)

(assert (=> b!766930 (and (bvsge (index!33722 lt!341140) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341140) (size!20659 a!3186)))))

(assert (=> b!766930 (= e!427082 (= (select (arr!20238 a!3186) (index!33722 lt!341140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766931 () Bool)

(assert (=> b!766931 (= e!427083 e!427085)))

(declare-fun res!518800 () Bool)

(assert (=> b!766931 (= res!518800 (and (is-Intermediate!7838 lt!341140) (not (undefined!8650 lt!341140)) (bvslt (x!64628 lt!341140) #b01111111111111111111111111111110) (bvsge (x!64628 lt!341140) #b00000000000000000000000000000000) (bvsge (x!64628 lt!341140) x!1131)))))

(assert (=> b!766931 (=> (not res!518800) (not e!427085))))

(declare-fun b!766932 () Bool)

(assert (=> b!766932 (and (bvsge (index!33722 lt!341140) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341140) (size!20659 a!3186)))))

(declare-fun res!518802 () Bool)

(assert (=> b!766932 (= res!518802 (= (select (arr!20238 a!3186) (index!33722 lt!341140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766932 (=> res!518802 e!427082)))

(assert (= (and d!101313 c!84453) b!766927))

(assert (= (and d!101313 (not c!84453)) b!766929))

(assert (= (and b!766929 c!84454) b!766924))

(assert (= (and b!766929 (not c!84454)) b!766926))

(assert (= (and d!101313 c!84455) b!766925))

(assert (= (and d!101313 (not c!84455)) b!766931))

(assert (= (and b!766931 res!518800) b!766928))

(assert (= (and b!766928 (not res!518801)) b!766932))

(assert (= (and b!766932 (not res!518802)) b!766930))

(declare-fun m!712799 () Bool)

(assert (=> b!766928 m!712799))

(assert (=> b!766930 m!712799))

(declare-fun m!712801 () Bool)

(assert (=> d!101313 m!712801))

(assert (=> d!101313 m!712447))

(assert (=> b!766926 m!712473))

(assert (=> b!766926 m!712473))

(assert (=> b!766926 m!712433))

(declare-fun m!712803 () Bool)

(assert (=> b!766926 m!712803))

(assert (=> b!766932 m!712799))

(assert (=> b!766454 d!101313))

(declare-fun b!766945 () Bool)

(declare-fun e!427093 () Bool)

(declare-fun call!35063 () Bool)

(assert (=> b!766945 (= e!427093 call!35063)))

(declare-fun d!101315 () Bool)

(declare-fun res!518803 () Bool)

(declare-fun e!427094 () Bool)

(assert (=> d!101315 (=> res!518803 e!427094)))

(assert (=> d!101315 (= res!518803 (bvsge j!159 (size!20659 a!3186)))))

(assert (=> d!101315 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427094)))

(declare-fun b!766946 () Bool)

(declare-fun e!427092 () Bool)

(assert (=> b!766946 (= e!427094 e!427092)))

(declare-fun c!84462 () Bool)

(assert (=> b!766946 (= c!84462 (validKeyInArray!0 (select (arr!20238 a!3186) j!159)))))

(declare-fun b!766947 () Bool)

(assert (=> b!766947 (= e!427092 e!427093)))

(declare-fun lt!341147 () (_ BitVec 64))

(assert (=> b!766947 (= lt!341147 (select (arr!20238 a!3186) j!159))))

(declare-fun lt!341146 () Unit!26402)

(assert (=> b!766947 (= lt!341146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341147 j!159))))

(assert (=> b!766947 (arrayContainsKey!0 a!3186 lt!341147 #b00000000000000000000000000000000)))

(declare-fun lt!341148 () Unit!26402)

(assert (=> b!766947 (= lt!341148 lt!341146)))

(declare-fun res!518804 () Bool)

(assert (=> b!766947 (= res!518804 (= (seekEntryOrOpen!0 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) (Found!7838 j!159)))))

(assert (=> b!766947 (=> (not res!518804) (not e!427093))))

(declare-fun b!766948 () Bool)

(assert (=> b!766948 (= e!427092 call!35063)))

(declare-fun bm!35060 () Bool)

(assert (=> bm!35060 (= call!35063 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!101315 (not res!518803)) b!766946))

(assert (= (and b!766946 c!84462) b!766947))

(assert (= (and b!766946 (not c!84462)) b!766948))

(assert (= (and b!766947 res!518804) b!766945))

(assert (= (or b!766945 b!766948) bm!35060))

(assert (=> b!766946 m!712433))

(assert (=> b!766946 m!712433))

(assert (=> b!766946 m!712435))

(assert (=> b!766947 m!712433))

(declare-fun m!712805 () Bool)

(assert (=> b!766947 m!712805))

(declare-fun m!712807 () Bool)

(assert (=> b!766947 m!712807))

(assert (=> b!766947 m!712433))

(assert (=> b!766947 m!712467))

(declare-fun m!712809 () Bool)

(assert (=> bm!35060 m!712809))

(assert (=> b!766450 d!101315))

(declare-fun d!101317 () Bool)

(assert (=> d!101317 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341158 () Unit!26402)

(declare-fun choose!38 (array!42267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26402)

(assert (=> d!101317 (= lt!341158 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101317 (validMask!0 mask!3328)))

(assert (=> d!101317 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341158)))

(declare-fun bs!21510 () Bool)

(assert (= bs!21510 d!101317))

(assert (=> bs!21510 m!712427))

(declare-fun m!712827 () Bool)

(assert (=> bs!21510 m!712827))

(assert (=> bs!21510 m!712447))

(assert (=> b!766450 d!101317))

(declare-fun b!766965 () Bool)

(declare-fun e!427107 () SeekEntryResult!7838)

(assert (=> b!766965 (= e!427107 (Intermediate!7838 false (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766966 () Bool)

(declare-fun e!427106 () Bool)

(declare-fun lt!341159 () SeekEntryResult!7838)

(assert (=> b!766966 (= e!427106 (bvsge (x!64628 lt!341159) #b01111111111111111111111111111110))))

(declare-fun b!766967 () Bool)

(assert (=> b!766967 (= e!427107 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!427104 () SeekEntryResult!7838)

(declare-fun b!766968 () Bool)

(assert (=> b!766968 (= e!427104 (Intermediate!7838 true (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101323 () Bool)

(assert (=> d!101323 e!427106))

(declare-fun c!84472 () Bool)

(assert (=> d!101323 (= c!84472 (and (is-Intermediate!7838 lt!341159) (undefined!8650 lt!341159)))))

(assert (=> d!101323 (= lt!341159 e!427104)))

(declare-fun c!84470 () Bool)

(assert (=> d!101323 (= c!84470 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341160 () (_ BitVec 64))

(assert (=> d!101323 (= lt!341160 (select (arr!20238 a!3186) (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328)))))

(assert (=> d!101323 (validMask!0 mask!3328)))

(assert (=> d!101323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341159)))

(declare-fun b!766969 () Bool)

(assert (=> b!766969 (and (bvsge (index!33722 lt!341159) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341159) (size!20659 a!3186)))))

(declare-fun res!518808 () Bool)

(assert (=> b!766969 (= res!518808 (= (select (arr!20238 a!3186) (index!33722 lt!341159)) (select (arr!20238 a!3186) j!159)))))

(declare-fun e!427105 () Bool)

(assert (=> b!766969 (=> res!518808 e!427105)))

(declare-fun e!427108 () Bool)

(assert (=> b!766969 (= e!427108 e!427105)))

(declare-fun b!766970 () Bool)

(assert (=> b!766970 (= e!427104 e!427107)))

(declare-fun c!84471 () Bool)

(assert (=> b!766970 (= c!84471 (or (= lt!341160 (select (arr!20238 a!3186) j!159)) (= (bvadd lt!341160 lt!341160) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766971 () Bool)

(assert (=> b!766971 (and (bvsge (index!33722 lt!341159) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341159) (size!20659 a!3186)))))

(assert (=> b!766971 (= e!427105 (= (select (arr!20238 a!3186) (index!33722 lt!341159)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766972 () Bool)

(assert (=> b!766972 (= e!427106 e!427108)))

(declare-fun res!518807 () Bool)

(assert (=> b!766972 (= res!518807 (and (is-Intermediate!7838 lt!341159) (not (undefined!8650 lt!341159)) (bvslt (x!64628 lt!341159) #b01111111111111111111111111111110) (bvsge (x!64628 lt!341159) #b00000000000000000000000000000000) (bvsge (x!64628 lt!341159) #b00000000000000000000000000000000)))))

(assert (=> b!766972 (=> (not res!518807) (not e!427108))))

(declare-fun b!766973 () Bool)

(assert (=> b!766973 (and (bvsge (index!33722 lt!341159) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341159) (size!20659 a!3186)))))

(declare-fun res!518809 () Bool)

(assert (=> b!766973 (= res!518809 (= (select (arr!20238 a!3186) (index!33722 lt!341159)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766973 (=> res!518809 e!427105)))

(assert (= (and d!101323 c!84470) b!766968))

(assert (= (and d!101323 (not c!84470)) b!766970))

(assert (= (and b!766970 c!84471) b!766965))

(assert (= (and b!766970 (not c!84471)) b!766967))

(assert (= (and d!101323 c!84472) b!766966))

(assert (= (and d!101323 (not c!84472)) b!766972))

(assert (= (and b!766972 res!518807) b!766969))

(assert (= (and b!766969 (not res!518808)) b!766973))

(assert (= (and b!766973 (not res!518809)) b!766971))

(declare-fun m!712835 () Bool)

(assert (=> b!766969 m!712835))

(assert (=> b!766971 m!712835))

(assert (=> d!101323 m!712463))

(declare-fun m!712837 () Bool)

(assert (=> d!101323 m!712837))

(assert (=> d!101323 m!712447))

(assert (=> b!766967 m!712463))

(declare-fun m!712839 () Bool)

(assert (=> b!766967 m!712839))

(assert (=> b!766967 m!712839))

(assert (=> b!766967 m!712433))

(declare-fun m!712841 () Bool)

(assert (=> b!766967 m!712841))

(assert (=> b!766973 m!712835))

(assert (=> b!766441 d!101323))

(declare-fun d!101327 () Bool)

(declare-fun lt!341162 () (_ BitVec 32))

(declare-fun lt!341161 () (_ BitVec 32))

(assert (=> d!101327 (= lt!341162 (bvmul (bvxor lt!341161 (bvlshr lt!341161 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101327 (= lt!341161 ((_ extract 31 0) (bvand (bvxor (select (arr!20238 a!3186) j!159) (bvlshr (select (arr!20238 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101327 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518781 (let ((h!15331 ((_ extract 31 0) (bvand (bvxor (select (arr!20238 a!3186) j!159) (bvlshr (select (arr!20238 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64640 (bvmul (bvxor h!15331 (bvlshr h!15331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64640 (bvlshr x!64640 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518781 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518781 #b00000000000000000000000000000000))))))

(assert (=> d!101327 (= (toIndex!0 (select (arr!20238 a!3186) j!159) mask!3328) (bvand (bvxor lt!341162 (bvlshr lt!341162 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766441 d!101327))

(declare-fun b!766974 () Bool)

(declare-fun e!427112 () SeekEntryResult!7838)

(assert (=> b!766974 (= e!427112 (Intermediate!7838 false lt!340946 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!766975 () Bool)

(declare-fun e!427111 () Bool)

(declare-fun lt!341163 () SeekEntryResult!7838)

(assert (=> b!766975 (= e!427111 (bvsge (x!64628 lt!341163) #b01111111111111111111111111111110))))

(declare-fun b!766976 () Bool)

(assert (=> b!766976 (= e!427112 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!340946 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766977 () Bool)

(declare-fun e!427109 () SeekEntryResult!7838)

(assert (=> b!766977 (= e!427109 (Intermediate!7838 true lt!340946 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!101329 () Bool)

(assert (=> d!101329 e!427111))

(declare-fun c!84475 () Bool)

(assert (=> d!101329 (= c!84475 (and (is-Intermediate!7838 lt!341163) (undefined!8650 lt!341163)))))

(assert (=> d!101329 (= lt!341163 e!427109)))

(declare-fun c!84473 () Bool)

(assert (=> d!101329 (= c!84473 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!341164 () (_ BitVec 64))

(assert (=> d!101329 (= lt!341164 (select (arr!20238 a!3186) lt!340946))))

(assert (=> d!101329 (validMask!0 mask!3328)))

(assert (=> d!101329 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340946 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341163)))

(declare-fun b!766978 () Bool)

(assert (=> b!766978 (and (bvsge (index!33722 lt!341163) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341163) (size!20659 a!3186)))))

(declare-fun res!518811 () Bool)

(assert (=> b!766978 (= res!518811 (= (select (arr!20238 a!3186) (index!33722 lt!341163)) (select (arr!20238 a!3186) j!159)))))

(declare-fun e!427110 () Bool)

(assert (=> b!766978 (=> res!518811 e!427110)))

(declare-fun e!427113 () Bool)

(assert (=> b!766978 (= e!427113 e!427110)))

(declare-fun b!766979 () Bool)

(assert (=> b!766979 (= e!427109 e!427112)))

(declare-fun c!84474 () Bool)

(assert (=> b!766979 (= c!84474 (or (= lt!341164 (select (arr!20238 a!3186) j!159)) (= (bvadd lt!341164 lt!341164) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766980 () Bool)

(assert (=> b!766980 (and (bvsge (index!33722 lt!341163) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341163) (size!20659 a!3186)))))

(assert (=> b!766980 (= e!427110 (= (select (arr!20238 a!3186) (index!33722 lt!341163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766981 () Bool)

(assert (=> b!766981 (= e!427111 e!427113)))

(declare-fun res!518810 () Bool)

(assert (=> b!766981 (= res!518810 (and (is-Intermediate!7838 lt!341163) (not (undefined!8650 lt!341163)) (bvslt (x!64628 lt!341163) #b01111111111111111111111111111110) (bvsge (x!64628 lt!341163) #b00000000000000000000000000000000) (bvsge (x!64628 lt!341163) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!766981 (=> (not res!518810) (not e!427113))))

(declare-fun b!766982 () Bool)

(assert (=> b!766982 (and (bvsge (index!33722 lt!341163) #b00000000000000000000000000000000) (bvslt (index!33722 lt!341163) (size!20659 a!3186)))))

(declare-fun res!518812 () Bool)

(assert (=> b!766982 (= res!518812 (= (select (arr!20238 a!3186) (index!33722 lt!341163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766982 (=> res!518812 e!427110)))

(assert (= (and d!101329 c!84473) b!766977))

(assert (= (and d!101329 (not c!84473)) b!766979))

(assert (= (and b!766979 c!84474) b!766974))

(assert (= (and b!766979 (not c!84474)) b!766976))

(assert (= (and d!101329 c!84475) b!766975))

(assert (= (and d!101329 (not c!84475)) b!766981))

(assert (= (and b!766981 res!518810) b!766978))

(assert (= (and b!766978 (not res!518811)) b!766982))

(assert (= (and b!766982 (not res!518812)) b!766980))

(declare-fun m!712843 () Bool)

(assert (=> b!766978 m!712843))

(assert (=> b!766980 m!712843))

(declare-fun m!712845 () Bool)

(assert (=> d!101329 m!712845))

(assert (=> d!101329 m!712447))

(declare-fun m!712847 () Bool)

(assert (=> b!766976 m!712847))

(assert (=> b!766976 m!712847))

(assert (=> b!766976 m!712433))

(declare-fun m!712849 () Bool)

(assert (=> b!766976 m!712849))

(assert (=> b!766982 m!712843))

(assert (=> b!766452 d!101329))

(declare-fun e!427115 () SeekEntryResult!7838)

(declare-fun b!766983 () Bool)

(assert (=> b!766983 (= e!427115 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!341166 () SeekEntryResult!7838)

(declare-fun d!101331 () Bool)

(assert (=> d!101331 (and (or (is-Undefined!7838 lt!341166) (not (is-Found!7838 lt!341166)) (and (bvsge (index!33721 lt!341166) #b00000000000000000000000000000000) (bvslt (index!33721 lt!341166) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341166) (is-Found!7838 lt!341166) (not (is-MissingVacant!7838 lt!341166)) (not (= (index!33723 lt!341166) resIntermediateIndex!5)) (and (bvsge (index!33723 lt!341166) #b00000000000000000000000000000000) (bvslt (index!33723 lt!341166) (size!20659 a!3186)))) (or (is-Undefined!7838 lt!341166) (ite (is-Found!7838 lt!341166) (= (select (arr!20238 a!3186) (index!33721 lt!341166)) (select (arr!20238 a!3186) j!159)) (and (is-MissingVacant!7838 lt!341166) (= (index!33723 lt!341166) resIntermediateIndex!5) (= (select (arr!20238 a!3186) (index!33723 lt!341166)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427116 () SeekEntryResult!7838)

(assert (=> d!101331 (= lt!341166 e!427116)))

(declare-fun c!84476 () Bool)

(assert (=> d!101331 (= c!84476 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341165 () (_ BitVec 64))

(assert (=> d!101331 (= lt!341165 (select (arr!20238 a!3186) index!1321))))

(assert (=> d!101331 (validMask!0 mask!3328)))

(assert (=> d!101331 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20238 a!3186) j!159) a!3186 mask!3328) lt!341166)))

(declare-fun b!766984 () Bool)

(assert (=> b!766984 (= e!427115 (MissingVacant!7838 resIntermediateIndex!5))))

(declare-fun b!766985 () Bool)

(assert (=> b!766985 (= e!427116 Undefined!7838)))

(declare-fun b!766986 () Bool)

(declare-fun e!427114 () SeekEntryResult!7838)

(assert (=> b!766986 (= e!427114 (Found!7838 index!1321))))

(declare-fun b!766987 () Bool)

(declare-fun c!84477 () Bool)

(assert (=> b!766987 (= c!84477 (= lt!341165 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766987 (= e!427114 e!427115)))

(declare-fun b!766988 () Bool)

(assert (=> b!766988 (= e!427116 e!427114)))

(declare-fun c!84478 () Bool)

(assert (=> b!766988 (= c!84478 (= lt!341165 (select (arr!20238 a!3186) j!159)))))

(assert (= (and d!101331 c!84476) b!766985))

(assert (= (and d!101331 (not c!84476)) b!766988))

(assert (= (and b!766988 c!84478) b!766986))

(assert (= (and b!766988 (not c!84478)) b!766987))

(assert (= (and b!766987 c!84477) b!766984))

(assert (= (and b!766987 (not c!84477)) b!766983))

(assert (=> b!766983 m!712473))

(assert (=> b!766983 m!712473))

(assert (=> b!766983 m!712433))

(declare-fun m!712851 () Bool)

(assert (=> b!766983 m!712851))

(declare-fun m!712853 () Bool)

(assert (=> d!101331 m!712853))

(declare-fun m!712855 () Bool)

(assert (=> d!101331 m!712855))

(assert (=> d!101331 m!712801))

(assert (=> d!101331 m!712447))

(assert (=> b!766451 d!101331))

(push 1)

