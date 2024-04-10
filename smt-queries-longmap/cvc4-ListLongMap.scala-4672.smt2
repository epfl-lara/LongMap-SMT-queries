; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64952 () Bool)

(assert start!64952)

(declare-fun b!733568 () Bool)

(declare-fun res!493057 () Bool)

(declare-fun e!410446 () Bool)

(assert (=> b!733568 (=> (not res!493057) (not e!410446))))

(declare-datatypes ((array!41263 0))(
  ( (array!41264 (arr!19748 (Array (_ BitVec 32) (_ BitVec 64))) (size!20169 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41263)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41263 (_ BitVec 32)) Bool)

(assert (=> b!733568 (= res!493057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!493054 () Bool)

(declare-fun e!410441 () Bool)

(assert (=> start!64952 (=> (not res!493054) (not e!410441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64952 (= res!493054 (validMask!0 mask!3328))))

(assert (=> start!64952 e!410441))

(assert (=> start!64952 true))

(declare-fun array_inv!15544 (array!41263) Bool)

(assert (=> start!64952 (array_inv!15544 a!3186)))

(declare-fun b!733569 () Bool)

(declare-fun e!410447 () Bool)

(declare-fun e!410443 () Bool)

(assert (=> b!733569 (= e!410447 e!410443)))

(declare-fun res!493041 () Bool)

(assert (=> b!733569 (=> res!493041 e!410443)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733569 (= res!493041 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325133 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733569 (= lt!325133 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733570 () Bool)

(declare-fun e!410445 () Bool)

(assert (=> b!733570 (= e!410446 e!410445)))

(declare-fun res!493042 () Bool)

(assert (=> b!733570 (=> (not res!493042) (not e!410445))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7348 0))(
  ( (MissingZero!7348 (index!31760 (_ BitVec 32))) (Found!7348 (index!31761 (_ BitVec 32))) (Intermediate!7348 (undefined!8160 Bool) (index!31762 (_ BitVec 32)) (x!62746 (_ BitVec 32))) (Undefined!7348) (MissingVacant!7348 (index!31763 (_ BitVec 32))) )
))
(declare-fun lt!325138 () SeekEntryResult!7348)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41263 (_ BitVec 32)) SeekEntryResult!7348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733570 (= res!493042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325138))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733570 (= lt!325138 (Intermediate!7348 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733571 () Bool)

(declare-fun e!410448 () Bool)

(assert (=> b!733571 (= e!410445 e!410448)))

(declare-fun res!493058 () Bool)

(assert (=> b!733571 (=> (not res!493058) (not e!410448))))

(declare-fun lt!325139 () SeekEntryResult!7348)

(declare-fun lt!325131 () SeekEntryResult!7348)

(assert (=> b!733571 (= res!493058 (= lt!325139 lt!325131))))

(declare-fun lt!325134 () (_ BitVec 64))

(declare-fun lt!325132 () array!41263)

(assert (=> b!733571 (= lt!325131 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325134 lt!325132 mask!3328))))

(assert (=> b!733571 (= lt!325139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325134 mask!3328) lt!325134 lt!325132 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!733571 (= lt!325134 (select (store (arr!19748 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733571 (= lt!325132 (array!41264 (store (arr!19748 a!3186) i!1173 k!2102) (size!20169 a!3186)))))

(declare-fun b!733572 () Bool)

(declare-fun res!493047 () Bool)

(assert (=> b!733572 (=> (not res!493047) (not e!410441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733572 (= res!493047 (validKeyInArray!0 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733573 () Bool)

(assert (=> b!733573 (= e!410443 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!325133 #b00000000000000000000000000000000) (bvslt lt!325133 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!410450 () Bool)

(declare-fun b!733574 () Bool)

(assert (=> b!733574 (= e!410450 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325138))))

(declare-fun b!733575 () Bool)

(declare-fun res!493050 () Bool)

(assert (=> b!733575 (=> (not res!493050) (not e!410446))))

(assert (=> b!733575 (= res!493050 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20169 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20169 a!3186))))))

(declare-fun b!733576 () Bool)

(declare-fun res!493055 () Bool)

(assert (=> b!733576 (=> (not res!493055) (not e!410445))))

(assert (=> b!733576 (= res!493055 e!410450)))

(declare-fun c!80641 () Bool)

(assert (=> b!733576 (= c!80641 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733577 () Bool)

(declare-fun e!410442 () Bool)

(declare-fun e!410444 () Bool)

(assert (=> b!733577 (= e!410442 e!410444)))

(declare-fun res!493045 () Bool)

(assert (=> b!733577 (=> (not res!493045) (not e!410444))))

(declare-fun lt!325137 () SeekEntryResult!7348)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41263 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!733577 (= res!493045 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325137))))

(assert (=> b!733577 (= lt!325137 (Found!7348 j!159))))

(declare-fun b!733578 () Bool)

(declare-fun res!493052 () Bool)

(assert (=> b!733578 (=> (not res!493052) (not e!410441))))

(assert (=> b!733578 (= res!493052 (validKeyInArray!0 k!2102))))

(declare-fun b!733579 () Bool)

(declare-fun res!493056 () Bool)

(assert (=> b!733579 (=> (not res!493056) (not e!410445))))

(assert (=> b!733579 (= res!493056 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19748 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733580 () Bool)

(declare-fun res!493049 () Bool)

(assert (=> b!733580 (=> (not res!493049) (not e!410441))))

(assert (=> b!733580 (= res!493049 (and (= (size!20169 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20169 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20169 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733581 () Bool)

(declare-fun res!493048 () Bool)

(assert (=> b!733581 (=> (not res!493048) (not e!410446))))

(declare-datatypes ((List!13750 0))(
  ( (Nil!13747) (Cons!13746 (h!14812 (_ BitVec 64)) (t!20065 List!13750)) )
))
(declare-fun arrayNoDuplicates!0 (array!41263 (_ BitVec 32) List!13750) Bool)

(assert (=> b!733581 (= res!493048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13747))))

(declare-fun b!733582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41263 (_ BitVec 32)) SeekEntryResult!7348)

(assert (=> b!733582 (= e!410450 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(declare-fun b!733583 () Bool)

(assert (=> b!733583 (= e!410448 (not e!410447))))

(declare-fun res!493051 () Bool)

(assert (=> b!733583 (=> res!493051 e!410447)))

(assert (=> b!733583 (= res!493051 (or (not (is-Intermediate!7348 lt!325131)) (bvsge x!1131 (x!62746 lt!325131))))))

(assert (=> b!733583 e!410442))

(declare-fun res!493043 () Bool)

(assert (=> b!733583 (=> (not res!493043) (not e!410442))))

(assert (=> b!733583 (= res!493043 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25014 0))(
  ( (Unit!25015) )
))
(declare-fun lt!325136 () Unit!25014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25014)

(assert (=> b!733583 (= lt!325136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733584 () Bool)

(declare-fun res!493044 () Bool)

(assert (=> b!733584 (=> res!493044 e!410443)))

(assert (=> b!733584 (= res!493044 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(declare-fun b!733585 () Bool)

(assert (=> b!733585 (= e!410441 e!410446)))

(declare-fun res!493053 () Bool)

(assert (=> b!733585 (=> (not res!493053) (not e!410446))))

(declare-fun lt!325135 () SeekEntryResult!7348)

(assert (=> b!733585 (= res!493053 (or (= lt!325135 (MissingZero!7348 i!1173)) (= lt!325135 (MissingVacant!7348 i!1173))))))

(assert (=> b!733585 (= lt!325135 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733586 () Bool)

(declare-fun res!493046 () Bool)

(assert (=> b!733586 (=> (not res!493046) (not e!410441))))

(declare-fun arrayContainsKey!0 (array!41263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733586 (= res!493046 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733587 () Bool)

(assert (=> b!733587 (= e!410444 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325137))))

(assert (= (and start!64952 res!493054) b!733580))

(assert (= (and b!733580 res!493049) b!733572))

(assert (= (and b!733572 res!493047) b!733578))

(assert (= (and b!733578 res!493052) b!733586))

(assert (= (and b!733586 res!493046) b!733585))

(assert (= (and b!733585 res!493053) b!733568))

(assert (= (and b!733568 res!493057) b!733581))

(assert (= (and b!733581 res!493048) b!733575))

(assert (= (and b!733575 res!493050) b!733570))

(assert (= (and b!733570 res!493042) b!733579))

(assert (= (and b!733579 res!493056) b!733576))

(assert (= (and b!733576 c!80641) b!733574))

(assert (= (and b!733576 (not c!80641)) b!733582))

(assert (= (and b!733576 res!493055) b!733571))

(assert (= (and b!733571 res!493058) b!733583))

(assert (= (and b!733583 res!493043) b!733577))

(assert (= (and b!733577 res!493045) b!733587))

(assert (= (and b!733583 (not res!493051)) b!733569))

(assert (= (and b!733569 (not res!493041)) b!733584))

(assert (= (and b!733584 (not res!493044)) b!733573))

(declare-fun m!686431 () Bool)

(assert (=> b!733584 m!686431))

(assert (=> b!733584 m!686431))

(declare-fun m!686433 () Bool)

(assert (=> b!733584 m!686433))

(declare-fun m!686435 () Bool)

(assert (=> b!733586 m!686435))

(assert (=> b!733574 m!686431))

(assert (=> b!733574 m!686431))

(declare-fun m!686437 () Bool)

(assert (=> b!733574 m!686437))

(assert (=> b!733570 m!686431))

(assert (=> b!733570 m!686431))

(declare-fun m!686439 () Bool)

(assert (=> b!733570 m!686439))

(assert (=> b!733570 m!686439))

(assert (=> b!733570 m!686431))

(declare-fun m!686441 () Bool)

(assert (=> b!733570 m!686441))

(declare-fun m!686443 () Bool)

(assert (=> b!733568 m!686443))

(assert (=> b!733582 m!686431))

(assert (=> b!733582 m!686431))

(assert (=> b!733582 m!686433))

(declare-fun m!686445 () Bool)

(assert (=> b!733585 m!686445))

(declare-fun m!686447 () Bool)

(assert (=> b!733579 m!686447))

(declare-fun m!686449 () Bool)

(assert (=> b!733578 m!686449))

(declare-fun m!686451 () Bool)

(assert (=> start!64952 m!686451))

(declare-fun m!686453 () Bool)

(assert (=> start!64952 m!686453))

(assert (=> b!733577 m!686431))

(assert (=> b!733577 m!686431))

(declare-fun m!686455 () Bool)

(assert (=> b!733577 m!686455))

(declare-fun m!686457 () Bool)

(assert (=> b!733583 m!686457))

(declare-fun m!686459 () Bool)

(assert (=> b!733583 m!686459))

(declare-fun m!686461 () Bool)

(assert (=> b!733571 m!686461))

(assert (=> b!733571 m!686461))

(declare-fun m!686463 () Bool)

(assert (=> b!733571 m!686463))

(declare-fun m!686465 () Bool)

(assert (=> b!733571 m!686465))

(declare-fun m!686467 () Bool)

(assert (=> b!733571 m!686467))

(declare-fun m!686469 () Bool)

(assert (=> b!733571 m!686469))

(assert (=> b!733572 m!686431))

(assert (=> b!733572 m!686431))

(declare-fun m!686471 () Bool)

(assert (=> b!733572 m!686471))

(declare-fun m!686473 () Bool)

(assert (=> b!733569 m!686473))

(declare-fun m!686475 () Bool)

(assert (=> b!733581 m!686475))

(assert (=> b!733587 m!686431))

(assert (=> b!733587 m!686431))

(declare-fun m!686477 () Bool)

(assert (=> b!733587 m!686477))

(push 1)

(assert (not b!733584))

(assert (not b!733587))

(assert (not b!733569))

(assert (not b!733572))

(assert (not b!733578))

(assert (not start!64952))

(assert (not b!733582))

(assert (not b!733585))

(assert (not b!733586))

(assert (not b!733581))

(assert (not b!733570))

(assert (not b!733574))

(assert (not b!733568))

(assert (not b!733583))

(assert (not b!733571))

(assert (not b!733577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!733659 () Bool)

(declare-fun e!410492 () SeekEntryResult!7348)

(declare-fun e!410493 () SeekEntryResult!7348)

(assert (=> b!733659 (= e!410492 e!410493)))

(declare-fun c!80672 () Bool)

(declare-fun lt!325172 () (_ BitVec 64))

(assert (=> b!733659 (= c!80672 (= lt!325172 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733660 () Bool)

(assert (=> b!733660 (= e!410492 Undefined!7348)))

(declare-fun b!733661 () Bool)

(declare-fun e!410494 () SeekEntryResult!7348)

(assert (=> b!733661 (= e!410494 (MissingVacant!7348 resIntermediateIndex!5))))

(declare-fun b!733662 () Bool)

(declare-fun c!80673 () Bool)

(assert (=> b!733662 (= c!80673 (= lt!325172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733662 (= e!410493 e!410494)))

(declare-fun b!733663 () Bool)

(assert (=> b!733663 (= e!410494 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733658 () Bool)

(assert (=> b!733658 (= e!410493 (Found!7348 resIntermediateIndex!5))))

(declare-fun d!99879 () Bool)

(declare-fun lt!325171 () SeekEntryResult!7348)

(assert (=> d!99879 (and (or (is-Undefined!7348 lt!325171) (not (is-Found!7348 lt!325171)) (and (bvsge (index!31761 lt!325171) #b00000000000000000000000000000000) (bvslt (index!31761 lt!325171) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325171) (is-Found!7348 lt!325171) (not (is-MissingVacant!7348 lt!325171)) (not (= (index!31763 lt!325171) resIntermediateIndex!5)) (and (bvsge (index!31763 lt!325171) #b00000000000000000000000000000000) (bvslt (index!31763 lt!325171) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325171) (ite (is-Found!7348 lt!325171) (= (select (arr!19748 a!3186) (index!31761 lt!325171)) (select (arr!19748 a!3186) j!159)) (and (is-MissingVacant!7348 lt!325171) (= (index!31763 lt!325171) resIntermediateIndex!5) (= (select (arr!19748 a!3186) (index!31763 lt!325171)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99879 (= lt!325171 e!410492)))

(declare-fun c!80671 () Bool)

(assert (=> d!99879 (= c!80671 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99879 (= lt!325172 (select (arr!19748 a!3186) resIntermediateIndex!5))))

(assert (=> d!99879 (validMask!0 mask!3328)))

(assert (=> d!99879 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325171)))

(assert (= (and d!99879 c!80671) b!733660))

(assert (= (and d!99879 (not c!80671)) b!733659))

(assert (= (and b!733659 c!80672) b!733658))

(assert (= (and b!733659 (not c!80672)) b!733662))

(assert (= (and b!733662 c!80673) b!733661))

(assert (= (and b!733662 (not c!80673)) b!733663))

(declare-fun m!686505 () Bool)

(assert (=> b!733663 m!686505))

(assert (=> b!733663 m!686505))

(assert (=> b!733663 m!686431))

(declare-fun m!686507 () Bool)

(assert (=> b!733663 m!686507))

(declare-fun m!686509 () Bool)

(assert (=> d!99879 m!686509))

(declare-fun m!686511 () Bool)

(assert (=> d!99879 m!686511))

(assert (=> d!99879 m!686447))

(assert (=> d!99879 m!686451))

(assert (=> b!733587 d!99879))

(declare-fun d!99885 () Bool)

(declare-fun res!493078 () Bool)

(declare-fun e!410509 () Bool)

(assert (=> d!99885 (=> res!493078 e!410509)))

(assert (=> d!99885 (= res!493078 (= (select (arr!19748 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99885 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!410509)))

(declare-fun b!733685 () Bool)

(declare-fun e!410510 () Bool)

(assert (=> b!733685 (= e!410509 e!410510)))

(declare-fun res!493079 () Bool)

(assert (=> b!733685 (=> (not res!493079) (not e!410510))))

(assert (=> b!733685 (= res!493079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20169 a!3186)))))

(declare-fun b!733686 () Bool)

(assert (=> b!733686 (= e!410510 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99885 (not res!493078)) b!733685))

(assert (= (and b!733685 res!493079) b!733686))

(declare-fun m!686543 () Bool)

(assert (=> d!99885 m!686543))

(declare-fun m!686545 () Bool)

(assert (=> b!733686 m!686545))

(assert (=> b!733586 d!99885))

(declare-fun b!733726 () Bool)

(declare-fun e!410534 () SeekEntryResult!7348)

(declare-fun e!410533 () SeekEntryResult!7348)

(assert (=> b!733726 (= e!410534 e!410533)))

(declare-fun lt!325192 () (_ BitVec 64))

(declare-fun lt!325190 () SeekEntryResult!7348)

(assert (=> b!733726 (= lt!325192 (select (arr!19748 a!3186) (index!31762 lt!325190)))))

(declare-fun c!80698 () Bool)

(assert (=> b!733726 (= c!80698 (= lt!325192 k!2102))))

(declare-fun b!733727 () Bool)

(assert (=> b!733727 (= e!410533 (Found!7348 (index!31762 lt!325190)))))

(declare-fun b!733728 () Bool)

(declare-fun e!410532 () SeekEntryResult!7348)

(assert (=> b!733728 (= e!410532 (MissingZero!7348 (index!31762 lt!325190)))))

(declare-fun b!733729 () Bool)

(declare-fun c!80696 () Bool)

(assert (=> b!733729 (= c!80696 (= lt!325192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733729 (= e!410533 e!410532)))

(declare-fun b!733730 () Bool)

(assert (=> b!733730 (= e!410532 (seekKeyOrZeroReturnVacant!0 (x!62746 lt!325190) (index!31762 lt!325190) (index!31762 lt!325190) k!2102 a!3186 mask!3328))))

(declare-fun d!99893 () Bool)

(declare-fun lt!325191 () SeekEntryResult!7348)

(assert (=> d!99893 (and (or (is-Undefined!7348 lt!325191) (not (is-Found!7348 lt!325191)) (and (bvsge (index!31761 lt!325191) #b00000000000000000000000000000000) (bvslt (index!31761 lt!325191) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325191) (is-Found!7348 lt!325191) (not (is-MissingZero!7348 lt!325191)) (and (bvsge (index!31760 lt!325191) #b00000000000000000000000000000000) (bvslt (index!31760 lt!325191) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325191) (is-Found!7348 lt!325191) (is-MissingZero!7348 lt!325191) (not (is-MissingVacant!7348 lt!325191)) (and (bvsge (index!31763 lt!325191) #b00000000000000000000000000000000) (bvslt (index!31763 lt!325191) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325191) (ite (is-Found!7348 lt!325191) (= (select (arr!19748 a!3186) (index!31761 lt!325191)) k!2102) (ite (is-MissingZero!7348 lt!325191) (= (select (arr!19748 a!3186) (index!31760 lt!325191)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7348 lt!325191) (= (select (arr!19748 a!3186) (index!31763 lt!325191)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99893 (= lt!325191 e!410534)))

(declare-fun c!80697 () Bool)

(assert (=> d!99893 (= c!80697 (and (is-Intermediate!7348 lt!325190) (undefined!8160 lt!325190)))))

(assert (=> d!99893 (= lt!325190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99893 (validMask!0 mask!3328)))

(assert (=> d!99893 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!325191)))

(declare-fun b!733731 () Bool)

(assert (=> b!733731 (= e!410534 Undefined!7348)))

(assert (= (and d!99893 c!80697) b!733731))

(assert (= (and d!99893 (not c!80697)) b!733726))

(assert (= (and b!733726 c!80698) b!733727))

(assert (= (and b!733726 (not c!80698)) b!733729))

(assert (= (and b!733729 c!80696) b!733728))

(assert (= (and b!733729 (not c!80696)) b!733730))

(declare-fun m!686547 () Bool)

(assert (=> b!733726 m!686547))

(declare-fun m!686550 () Bool)

(assert (=> b!733730 m!686550))

(declare-fun m!686553 () Bool)

(assert (=> d!99893 m!686553))

(declare-fun m!686555 () Bool)

(assert (=> d!99893 m!686555))

(assert (=> d!99893 m!686553))

(declare-fun m!686557 () Bool)

(assert (=> d!99893 m!686557))

(assert (=> d!99893 m!686451))

(declare-fun m!686561 () Bool)

(assert (=> d!99893 m!686561))

(declare-fun m!686563 () Bool)

(assert (=> d!99893 m!686563))

(assert (=> b!733585 d!99893))

(declare-fun b!733787 () Bool)

(declare-fun e!410572 () Bool)

(declare-fun lt!325217 () SeekEntryResult!7348)

(assert (=> b!733787 (= e!410572 (bvsge (x!62746 lt!325217) #b01111111111111111111111111111110))))

(declare-fun b!733788 () Bool)

(assert (=> b!733788 (and (bvsge (index!31762 lt!325217) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325217) (size!20169 a!3186)))))

(declare-fun res!493115 () Bool)

(assert (=> b!733788 (= res!493115 (= (select (arr!19748 a!3186) (index!31762 lt!325217)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410571 () Bool)

(assert (=> b!733788 (=> res!493115 e!410571)))

(declare-fun b!733789 () Bool)

(declare-fun e!410569 () SeekEntryResult!7348)

(assert (=> b!733789 (= e!410569 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733790 () Bool)

(declare-fun e!410570 () Bool)

(assert (=> b!733790 (= e!410572 e!410570)))

(declare-fun res!493114 () Bool)

(assert (=> b!733790 (= res!493114 (and (is-Intermediate!7348 lt!325217) (not (undefined!8160 lt!325217)) (bvslt (x!62746 lt!325217) #b01111111111111111111111111111110) (bvsge (x!62746 lt!325217) #b00000000000000000000000000000000) (bvsge (x!62746 lt!325217) x!1131)))))

(assert (=> b!733790 (=> (not res!493114) (not e!410570))))

(declare-fun d!99897 () Bool)

(assert (=> d!99897 e!410572))

(declare-fun c!80716 () Bool)

(assert (=> d!99897 (= c!80716 (and (is-Intermediate!7348 lt!325217) (undefined!8160 lt!325217)))))

(declare-fun e!410573 () SeekEntryResult!7348)

(assert (=> d!99897 (= lt!325217 e!410573)))

(declare-fun c!80717 () Bool)

(assert (=> d!99897 (= c!80717 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325218 () (_ BitVec 64))

(assert (=> d!99897 (= lt!325218 (select (arr!19748 a!3186) index!1321))))

(assert (=> d!99897 (validMask!0 mask!3328)))

(assert (=> d!99897 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325217)))

(declare-fun b!733791 () Bool)

(assert (=> b!733791 (= e!410569 (Intermediate!7348 false index!1321 x!1131))))

(declare-fun b!733792 () Bool)

(assert (=> b!733792 (and (bvsge (index!31762 lt!325217) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325217) (size!20169 a!3186)))))

(declare-fun res!493113 () Bool)

(assert (=> b!733792 (= res!493113 (= (select (arr!19748 a!3186) (index!31762 lt!325217)) (select (arr!19748 a!3186) j!159)))))

(assert (=> b!733792 (=> res!493113 e!410571)))

(assert (=> b!733792 (= e!410570 e!410571)))

(declare-fun b!733793 () Bool)

(assert (=> b!733793 (= e!410573 e!410569)))

(declare-fun c!80715 () Bool)

(assert (=> b!733793 (= c!80715 (or (= lt!325218 (select (arr!19748 a!3186) j!159)) (= (bvadd lt!325218 lt!325218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733794 () Bool)

(assert (=> b!733794 (and (bvsge (index!31762 lt!325217) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325217) (size!20169 a!3186)))))

(assert (=> b!733794 (= e!410571 (= (select (arr!19748 a!3186) (index!31762 lt!325217)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733795 () Bool)

(assert (=> b!733795 (= e!410573 (Intermediate!7348 true index!1321 x!1131))))

(assert (= (and d!99897 c!80717) b!733795))

(assert (= (and d!99897 (not c!80717)) b!733793))

(assert (= (and b!733793 c!80715) b!733791))

(assert (= (and b!733793 (not c!80715)) b!733789))

(assert (= (and d!99897 c!80716) b!733787))

(assert (= (and d!99897 (not c!80716)) b!733790))

(assert (= (and b!733790 res!493114) b!733792))

(assert (= (and b!733792 (not res!493113)) b!733788))

(assert (= (and b!733788 (not res!493115)) b!733794))

(declare-fun m!686599 () Bool)

(assert (=> b!733792 m!686599))

(assert (=> b!733788 m!686599))

(declare-fun m!686601 () Bool)

(assert (=> d!99897 m!686601))

(assert (=> d!99897 m!686451))

(assert (=> b!733794 m!686599))

(assert (=> b!733789 m!686473))

(assert (=> b!733789 m!686473))

(assert (=> b!733789 m!686431))

(declare-fun m!686603 () Bool)

(assert (=> b!733789 m!686603))

(assert (=> b!733574 d!99897))

(declare-fun b!733797 () Bool)

(declare-fun e!410574 () SeekEntryResult!7348)

(declare-fun e!410575 () SeekEntryResult!7348)

(assert (=> b!733797 (= e!410574 e!410575)))

(declare-fun c!80719 () Bool)

(declare-fun lt!325220 () (_ BitVec 64))

(assert (=> b!733797 (= c!80719 (= lt!325220 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733798 () Bool)

(assert (=> b!733798 (= e!410574 Undefined!7348)))

(declare-fun b!733799 () Bool)

(declare-fun e!410576 () SeekEntryResult!7348)

(assert (=> b!733799 (= e!410576 (MissingVacant!7348 resIntermediateIndex!5))))

(declare-fun b!733800 () Bool)

(declare-fun c!80720 () Bool)

(assert (=> b!733800 (= c!80720 (= lt!325220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733800 (= e!410575 e!410576)))

(declare-fun b!733801 () Bool)

(assert (=> b!733801 (= e!410576 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733796 () Bool)

(assert (=> b!733796 (= e!410575 (Found!7348 index!1321))))

(declare-fun lt!325219 () SeekEntryResult!7348)

(declare-fun d!99915 () Bool)

(assert (=> d!99915 (and (or (is-Undefined!7348 lt!325219) (not (is-Found!7348 lt!325219)) (and (bvsge (index!31761 lt!325219) #b00000000000000000000000000000000) (bvslt (index!31761 lt!325219) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325219) (is-Found!7348 lt!325219) (not (is-MissingVacant!7348 lt!325219)) (not (= (index!31763 lt!325219) resIntermediateIndex!5)) (and (bvsge (index!31763 lt!325219) #b00000000000000000000000000000000) (bvslt (index!31763 lt!325219) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325219) (ite (is-Found!7348 lt!325219) (= (select (arr!19748 a!3186) (index!31761 lt!325219)) (select (arr!19748 a!3186) j!159)) (and (is-MissingVacant!7348 lt!325219) (= (index!31763 lt!325219) resIntermediateIndex!5) (= (select (arr!19748 a!3186) (index!31763 lt!325219)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99915 (= lt!325219 e!410574)))

(declare-fun c!80718 () Bool)

(assert (=> d!99915 (= c!80718 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99915 (= lt!325220 (select (arr!19748 a!3186) index!1321))))

(assert (=> d!99915 (validMask!0 mask!3328)))

(assert (=> d!99915 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325219)))

(assert (= (and d!99915 c!80718) b!733798))

(assert (= (and d!99915 (not c!80718)) b!733797))

(assert (= (and b!733797 c!80719) b!733796))

(assert (= (and b!733797 (not c!80719)) b!733800))

(assert (= (and b!733800 c!80720) b!733799))

(assert (= (and b!733800 (not c!80720)) b!733801))

(assert (=> b!733801 m!686473))

(assert (=> b!733801 m!686473))

(assert (=> b!733801 m!686431))

(declare-fun m!686605 () Bool)

(assert (=> b!733801 m!686605))

(declare-fun m!686607 () Bool)

(assert (=> d!99915 m!686607))

(declare-fun m!686609 () Bool)

(assert (=> d!99915 m!686609))

(assert (=> d!99915 m!686601))

(assert (=> d!99915 m!686451))

(assert (=> b!733584 d!99915))

(declare-fun b!733810 () Bool)

(declare-fun e!410585 () Bool)

(declare-fun e!410584 () Bool)

(assert (=> b!733810 (= e!410585 e!410584)))

(declare-fun c!80723 () Bool)

(assert (=> b!733810 (= c!80723 (validKeyInArray!0 (select (arr!19748 a!3186) j!159)))))

(declare-fun d!99917 () Bool)

(declare-fun res!493120 () Bool)

(assert (=> d!99917 (=> res!493120 e!410585)))

(assert (=> d!99917 (= res!493120 (bvsge j!159 (size!20169 a!3186)))))

(assert (=> d!99917 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410585)))

(declare-fun b!733811 () Bool)

(declare-fun e!410583 () Bool)

(assert (=> b!733811 (= e!410584 e!410583)))

(declare-fun lt!325229 () (_ BitVec 64))

(assert (=> b!733811 (= lt!325229 (select (arr!19748 a!3186) j!159))))

(declare-fun lt!325228 () Unit!25014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41263 (_ BitVec 64) (_ BitVec 32)) Unit!25014)

(assert (=> b!733811 (= lt!325228 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325229 j!159))))

(assert (=> b!733811 (arrayContainsKey!0 a!3186 lt!325229 #b00000000000000000000000000000000)))

(declare-fun lt!325227 () Unit!25014)

(assert (=> b!733811 (= lt!325227 lt!325228)))

(declare-fun res!493121 () Bool)

(assert (=> b!733811 (= res!493121 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) (Found!7348 j!159)))))

(assert (=> b!733811 (=> (not res!493121) (not e!410583))))

(declare-fun b!733812 () Bool)

(declare-fun call!34879 () Bool)

(assert (=> b!733812 (= e!410584 call!34879)))

(declare-fun bm!34876 () Bool)

(assert (=> bm!34876 (= call!34879 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733813 () Bool)

(assert (=> b!733813 (= e!410583 call!34879)))

(assert (= (and d!99917 (not res!493120)) b!733810))

(assert (= (and b!733810 c!80723) b!733811))

(assert (= (and b!733810 (not c!80723)) b!733812))

(assert (= (and b!733811 res!493121) b!733813))

(assert (= (or b!733813 b!733812) bm!34876))

(assert (=> b!733810 m!686431))

(assert (=> b!733810 m!686431))

(assert (=> b!733810 m!686471))

(assert (=> b!733811 m!686431))

(declare-fun m!686611 () Bool)

(assert (=> b!733811 m!686611))

(declare-fun m!686613 () Bool)

(assert (=> b!733811 m!686613))

(assert (=> b!733811 m!686431))

(assert (=> b!733811 m!686455))

(declare-fun m!686615 () Bool)

(assert (=> bm!34876 m!686615))

(assert (=> b!733583 d!99917))

(declare-fun d!99921 () Bool)

(assert (=> d!99921 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325232 () Unit!25014)

(declare-fun choose!38 (array!41263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25014)

(assert (=> d!99921 (= lt!325232 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99921 (validMask!0 mask!3328)))

(assert (=> d!99921 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325232)))

(declare-fun bs!20973 () Bool)

(assert (= bs!20973 d!99921))

(assert (=> bs!20973 m!686457))

(declare-fun m!686617 () Bool)

(assert (=> bs!20973 m!686617))

(assert (=> bs!20973 m!686451))

(assert (=> b!733583 d!99921))

(declare-fun d!99923 () Bool)

(assert (=> d!99923 (= (validKeyInArray!0 (select (arr!19748 a!3186) j!159)) (and (not (= (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19748 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733572 d!99923))

(assert (=> b!733582 d!99915))

(declare-fun d!99925 () Bool)

(assert (=> d!99925 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64952 d!99925))

(declare-fun d!99927 () Bool)

(assert (=> d!99927 (= (array_inv!15544 a!3186) (bvsge (size!20169 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64952 d!99927))

(declare-fun b!733826 () Bool)

(declare-fun e!410595 () Bool)

(declare-fun lt!325239 () SeekEntryResult!7348)

(assert (=> b!733826 (= e!410595 (bvsge (x!62746 lt!325239) #b01111111111111111111111111111110))))

(declare-fun b!733827 () Bool)

(assert (=> b!733827 (and (bvsge (index!31762 lt!325239) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325239) (size!20169 lt!325132)))))

(declare-fun res!493124 () Bool)

(assert (=> b!733827 (= res!493124 (= (select (arr!19748 lt!325132) (index!31762 lt!325239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410594 () Bool)

(assert (=> b!733827 (=> res!493124 e!410594)))

(declare-fun e!410592 () SeekEntryResult!7348)

(declare-fun b!733828 () Bool)

(assert (=> b!733828 (= e!410592 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325134 lt!325132 mask!3328))))

(declare-fun b!733829 () Bool)

(declare-fun e!410593 () Bool)

(assert (=> b!733829 (= e!410595 e!410593)))

(declare-fun res!493123 () Bool)

(assert (=> b!733829 (= res!493123 (and (is-Intermediate!7348 lt!325239) (not (undefined!8160 lt!325239)) (bvslt (x!62746 lt!325239) #b01111111111111111111111111111110) (bvsge (x!62746 lt!325239) #b00000000000000000000000000000000) (bvsge (x!62746 lt!325239) x!1131)))))

(assert (=> b!733829 (=> (not res!493123) (not e!410593))))

(declare-fun d!99929 () Bool)

(assert (=> d!99929 e!410595))

(declare-fun c!80731 () Bool)

(assert (=> d!99929 (= c!80731 (and (is-Intermediate!7348 lt!325239) (undefined!8160 lt!325239)))))

(declare-fun e!410596 () SeekEntryResult!7348)

(assert (=> d!99929 (= lt!325239 e!410596)))

(declare-fun c!80732 () Bool)

(assert (=> d!99929 (= c!80732 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325240 () (_ BitVec 64))

(assert (=> d!99929 (= lt!325240 (select (arr!19748 lt!325132) index!1321))))

(assert (=> d!99929 (validMask!0 mask!3328)))

(assert (=> d!99929 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325134 lt!325132 mask!3328) lt!325239)))

(declare-fun b!733830 () Bool)

(assert (=> b!733830 (= e!410592 (Intermediate!7348 false index!1321 x!1131))))

(declare-fun b!733831 () Bool)

(assert (=> b!733831 (and (bvsge (index!31762 lt!325239) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325239) (size!20169 lt!325132)))))

(declare-fun res!493122 () Bool)

(assert (=> b!733831 (= res!493122 (= (select (arr!19748 lt!325132) (index!31762 lt!325239)) lt!325134))))

(assert (=> b!733831 (=> res!493122 e!410594)))

(assert (=> b!733831 (= e!410593 e!410594)))

(declare-fun b!733832 () Bool)

(assert (=> b!733832 (= e!410596 e!410592)))

(declare-fun c!80730 () Bool)

(assert (=> b!733832 (= c!80730 (or (= lt!325240 lt!325134) (= (bvadd lt!325240 lt!325240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733833 () Bool)

(assert (=> b!733833 (and (bvsge (index!31762 lt!325239) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325239) (size!20169 lt!325132)))))

(assert (=> b!733833 (= e!410594 (= (select (arr!19748 lt!325132) (index!31762 lt!325239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733834 () Bool)

(assert (=> b!733834 (= e!410596 (Intermediate!7348 true index!1321 x!1131))))

(assert (= (and d!99929 c!80732) b!733834))

(assert (= (and d!99929 (not c!80732)) b!733832))

(assert (= (and b!733832 c!80730) b!733830))

(assert (= (and b!733832 (not c!80730)) b!733828))

(assert (= (and d!99929 c!80731) b!733826))

(assert (= (and d!99929 (not c!80731)) b!733829))

(assert (= (and b!733829 res!493123) b!733831))

(assert (= (and b!733831 (not res!493122)) b!733827))

(assert (= (and b!733827 (not res!493124)) b!733833))

(declare-fun m!686619 () Bool)

(assert (=> b!733831 m!686619))

(assert (=> b!733827 m!686619))

(declare-fun m!686621 () Bool)

(assert (=> d!99929 m!686621))

(assert (=> d!99929 m!686451))

(assert (=> b!733833 m!686619))

(assert (=> b!733828 m!686473))

(assert (=> b!733828 m!686473))

(declare-fun m!686623 () Bool)

(assert (=> b!733828 m!686623))

(assert (=> b!733571 d!99929))

(declare-fun b!733835 () Bool)

(declare-fun e!410600 () Bool)

(declare-fun lt!325241 () SeekEntryResult!7348)

(assert (=> b!733835 (= e!410600 (bvsge (x!62746 lt!325241) #b01111111111111111111111111111110))))

(declare-fun b!733836 () Bool)

(assert (=> b!733836 (and (bvsge (index!31762 lt!325241) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325241) (size!20169 lt!325132)))))

(declare-fun res!493127 () Bool)

(assert (=> b!733836 (= res!493127 (= (select (arr!19748 lt!325132) (index!31762 lt!325241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410599 () Bool)

(assert (=> b!733836 (=> res!493127 e!410599)))

(declare-fun e!410597 () SeekEntryResult!7348)

(declare-fun b!733837 () Bool)

(assert (=> b!733837 (= e!410597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325134 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325134 lt!325132 mask!3328))))

(declare-fun b!733838 () Bool)

(declare-fun e!410598 () Bool)

(assert (=> b!733838 (= e!410600 e!410598)))

(declare-fun res!493126 () Bool)

(assert (=> b!733838 (= res!493126 (and (is-Intermediate!7348 lt!325241) (not (undefined!8160 lt!325241)) (bvslt (x!62746 lt!325241) #b01111111111111111111111111111110) (bvsge (x!62746 lt!325241) #b00000000000000000000000000000000) (bvsge (x!62746 lt!325241) #b00000000000000000000000000000000)))))

(assert (=> b!733838 (=> (not res!493126) (not e!410598))))

(declare-fun d!99931 () Bool)

(assert (=> d!99931 e!410600))

(declare-fun c!80734 () Bool)

(assert (=> d!99931 (= c!80734 (and (is-Intermediate!7348 lt!325241) (undefined!8160 lt!325241)))))

(declare-fun e!410601 () SeekEntryResult!7348)

(assert (=> d!99931 (= lt!325241 e!410601)))

(declare-fun c!80735 () Bool)

(assert (=> d!99931 (= c!80735 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325242 () (_ BitVec 64))

(assert (=> d!99931 (= lt!325242 (select (arr!19748 lt!325132) (toIndex!0 lt!325134 mask!3328)))))

(assert (=> d!99931 (validMask!0 mask!3328)))

(assert (=> d!99931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325134 mask!3328) lt!325134 lt!325132 mask!3328) lt!325241)))

(declare-fun b!733839 () Bool)

(assert (=> b!733839 (= e!410597 (Intermediate!7348 false (toIndex!0 lt!325134 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733840 () Bool)

(assert (=> b!733840 (and (bvsge (index!31762 lt!325241) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325241) (size!20169 lt!325132)))))

(declare-fun res!493125 () Bool)

(assert (=> b!733840 (= res!493125 (= (select (arr!19748 lt!325132) (index!31762 lt!325241)) lt!325134))))

(assert (=> b!733840 (=> res!493125 e!410599)))

(assert (=> b!733840 (= e!410598 e!410599)))

(declare-fun b!733841 () Bool)

(assert (=> b!733841 (= e!410601 e!410597)))

(declare-fun c!80733 () Bool)

(assert (=> b!733841 (= c!80733 (or (= lt!325242 lt!325134) (= (bvadd lt!325242 lt!325242) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733842 () Bool)

(assert (=> b!733842 (and (bvsge (index!31762 lt!325241) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325241) (size!20169 lt!325132)))))

(assert (=> b!733842 (= e!410599 (= (select (arr!19748 lt!325132) (index!31762 lt!325241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733843 () Bool)

(assert (=> b!733843 (= e!410601 (Intermediate!7348 true (toIndex!0 lt!325134 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99931 c!80735) b!733843))

(assert (= (and d!99931 (not c!80735)) b!733841))

(assert (= (and b!733841 c!80733) b!733839))

(assert (= (and b!733841 (not c!80733)) b!733837))

(assert (= (and d!99931 c!80734) b!733835))

(assert (= (and d!99931 (not c!80734)) b!733838))

(assert (= (and b!733838 res!493126) b!733840))

(assert (= (and b!733840 (not res!493125)) b!733836))

(assert (= (and b!733836 (not res!493127)) b!733842))

(declare-fun m!686625 () Bool)

(assert (=> b!733840 m!686625))

(assert (=> b!733836 m!686625))

(assert (=> d!99931 m!686461))

(declare-fun m!686627 () Bool)

(assert (=> d!99931 m!686627))

(assert (=> d!99931 m!686451))

(assert (=> b!733842 m!686625))

(assert (=> b!733837 m!686461))

(declare-fun m!686629 () Bool)

(assert (=> b!733837 m!686629))

(assert (=> b!733837 m!686629))

(declare-fun m!686631 () Bool)

(assert (=> b!733837 m!686631))

(assert (=> b!733571 d!99931))

(declare-fun d!99933 () Bool)

(declare-fun lt!325251 () (_ BitVec 32))

(declare-fun lt!325250 () (_ BitVec 32))

(assert (=> d!99933 (= lt!325251 (bvmul (bvxor lt!325250 (bvlshr lt!325250 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99933 (= lt!325250 ((_ extract 31 0) (bvand (bvxor lt!325134 (bvlshr lt!325134 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99933 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493128 (let ((h!14814 ((_ extract 31 0) (bvand (bvxor lt!325134 (bvlshr lt!325134 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62753 (bvmul (bvxor h!14814 (bvlshr h!14814 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62753 (bvlshr x!62753 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493128 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493128 #b00000000000000000000000000000000))))))

(assert (=> d!99933 (= (toIndex!0 lt!325134 mask!3328) (bvand (bvxor lt!325251 (bvlshr lt!325251 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733571 d!99933))

(declare-fun b!733872 () Bool)

(declare-fun e!410625 () Bool)

(declare-fun contains!4058 (List!13750 (_ BitVec 64)) Bool)

(assert (=> b!733872 (= e!410625 (contains!4058 Nil!13747 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99937 () Bool)

(declare-fun res!493142 () Bool)

(declare-fun e!410622 () Bool)

(assert (=> d!99937 (=> res!493142 e!410622)))

(assert (=> d!99937 (= res!493142 (bvsge #b00000000000000000000000000000000 (size!20169 a!3186)))))

(assert (=> d!99937 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13747) e!410622)))

(declare-fun b!733873 () Bool)

(declare-fun e!410623 () Bool)

(assert (=> b!733873 (= e!410622 e!410623)))

(declare-fun res!493143 () Bool)

(assert (=> b!733873 (=> (not res!493143) (not e!410623))))

(assert (=> b!733873 (= res!493143 (not e!410625))))

(declare-fun res!493141 () Bool)

(assert (=> b!733873 (=> (not res!493141) (not e!410625))))

(assert (=> b!733873 (= res!493141 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!733874 () Bool)

(declare-fun e!410624 () Bool)

(declare-fun call!34882 () Bool)

(assert (=> b!733874 (= e!410624 call!34882)))

(declare-fun b!733875 () Bool)

(assert (=> b!733875 (= e!410623 e!410624)))

(declare-fun c!80744 () Bool)

(assert (=> b!733875 (= c!80744 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!733876 () Bool)

(assert (=> b!733876 (= e!410624 call!34882)))

(declare-fun bm!34879 () Bool)

(assert (=> bm!34879 (= call!34882 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80744 (Cons!13746 (select (arr!19748 a!3186) #b00000000000000000000000000000000) Nil!13747) Nil!13747)))))

(assert (= (and d!99937 (not res!493142)) b!733873))

(assert (= (and b!733873 res!493141) b!733872))

(assert (= (and b!733873 res!493143) b!733875))

(assert (= (and b!733875 c!80744) b!733874))

(assert (= (and b!733875 (not c!80744)) b!733876))

(assert (= (or b!733874 b!733876) bm!34879))

(assert (=> b!733872 m!686543))

(assert (=> b!733872 m!686543))

(declare-fun m!686661 () Bool)

(assert (=> b!733872 m!686661))

(assert (=> b!733873 m!686543))

(assert (=> b!733873 m!686543))

(declare-fun m!686663 () Bool)

(assert (=> b!733873 m!686663))

(assert (=> b!733875 m!686543))

(assert (=> b!733875 m!686543))

(assert (=> b!733875 m!686663))

(assert (=> bm!34879 m!686543))

(declare-fun m!686665 () Bool)

(assert (=> bm!34879 m!686665))

(assert (=> b!733581 d!99937))

(declare-fun b!733877 () Bool)

(declare-fun e!410629 () Bool)

(declare-fun lt!325255 () SeekEntryResult!7348)

(assert (=> b!733877 (= e!410629 (bvsge (x!62746 lt!325255) #b01111111111111111111111111111110))))

(declare-fun b!733878 () Bool)

(assert (=> b!733878 (and (bvsge (index!31762 lt!325255) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325255) (size!20169 a!3186)))))

(declare-fun res!493146 () Bool)

(assert (=> b!733878 (= res!493146 (= (select (arr!19748 a!3186) (index!31762 lt!325255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410628 () Bool)

(assert (=> b!733878 (=> res!493146 e!410628)))

(declare-fun b!733879 () Bool)

(declare-fun e!410626 () SeekEntryResult!7348)

(assert (=> b!733879 (= e!410626 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733880 () Bool)

(declare-fun e!410627 () Bool)

(assert (=> b!733880 (= e!410629 e!410627)))

(declare-fun res!493145 () Bool)

(assert (=> b!733880 (= res!493145 (and (is-Intermediate!7348 lt!325255) (not (undefined!8160 lt!325255)) (bvslt (x!62746 lt!325255) #b01111111111111111111111111111110) (bvsge (x!62746 lt!325255) #b00000000000000000000000000000000) (bvsge (x!62746 lt!325255) #b00000000000000000000000000000000)))))

(assert (=> b!733880 (=> (not res!493145) (not e!410627))))

(declare-fun d!99947 () Bool)

(assert (=> d!99947 e!410629))

(declare-fun c!80746 () Bool)

(assert (=> d!99947 (= c!80746 (and (is-Intermediate!7348 lt!325255) (undefined!8160 lt!325255)))))

(declare-fun e!410630 () SeekEntryResult!7348)

(assert (=> d!99947 (= lt!325255 e!410630)))

(declare-fun c!80747 () Bool)

(assert (=> d!99947 (= c!80747 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325256 () (_ BitVec 64))

(assert (=> d!99947 (= lt!325256 (select (arr!19748 a!3186) (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328)))))

(assert (=> d!99947 (validMask!0 mask!3328)))

(assert (=> d!99947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325255)))

(declare-fun b!733881 () Bool)

(assert (=> b!733881 (= e!410626 (Intermediate!7348 false (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733882 () Bool)

(assert (=> b!733882 (and (bvsge (index!31762 lt!325255) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325255) (size!20169 a!3186)))))

(declare-fun res!493144 () Bool)

(assert (=> b!733882 (= res!493144 (= (select (arr!19748 a!3186) (index!31762 lt!325255)) (select (arr!19748 a!3186) j!159)))))

(assert (=> b!733882 (=> res!493144 e!410628)))

(assert (=> b!733882 (= e!410627 e!410628)))

(declare-fun b!733883 () Bool)

(assert (=> b!733883 (= e!410630 e!410626)))

(declare-fun c!80745 () Bool)

(assert (=> b!733883 (= c!80745 (or (= lt!325256 (select (arr!19748 a!3186) j!159)) (= (bvadd lt!325256 lt!325256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733884 () Bool)

(assert (=> b!733884 (and (bvsge (index!31762 lt!325255) #b00000000000000000000000000000000) (bvslt (index!31762 lt!325255) (size!20169 a!3186)))))

(assert (=> b!733884 (= e!410628 (= (select (arr!19748 a!3186) (index!31762 lt!325255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733885 () Bool)

(assert (=> b!733885 (= e!410630 (Intermediate!7348 true (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99947 c!80747) b!733885))

(assert (= (and d!99947 (not c!80747)) b!733883))

(assert (= (and b!733883 c!80745) b!733881))

(assert (= (and b!733883 (not c!80745)) b!733879))

(assert (= (and d!99947 c!80746) b!733877))

(assert (= (and d!99947 (not c!80746)) b!733880))

(assert (= (and b!733880 res!493145) b!733882))

(assert (= (and b!733882 (not res!493144)) b!733878))

(assert (= (and b!733878 (not res!493146)) b!733884))

(declare-fun m!686667 () Bool)

(assert (=> b!733882 m!686667))

(assert (=> b!733878 m!686667))

(assert (=> d!99947 m!686439))

(declare-fun m!686669 () Bool)

(assert (=> d!99947 m!686669))

(assert (=> d!99947 m!686451))

(assert (=> b!733884 m!686667))

(assert (=> b!733879 m!686439))

(declare-fun m!686671 () Bool)

(assert (=> b!733879 m!686671))

(assert (=> b!733879 m!686671))

(assert (=> b!733879 m!686431))

(declare-fun m!686673 () Bool)

(assert (=> b!733879 m!686673))

(assert (=> b!733570 d!99947))

(declare-fun d!99949 () Bool)

(declare-fun lt!325258 () (_ BitVec 32))

(declare-fun lt!325257 () (_ BitVec 32))

(assert (=> d!99949 (= lt!325258 (bvmul (bvxor lt!325257 (bvlshr lt!325257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99949 (= lt!325257 ((_ extract 31 0) (bvand (bvxor (select (arr!19748 a!3186) j!159) (bvlshr (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99949 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493128 (let ((h!14814 ((_ extract 31 0) (bvand (bvxor (select (arr!19748 a!3186) j!159) (bvlshr (select (arr!19748 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62753 (bvmul (bvxor h!14814 (bvlshr h!14814 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62753 (bvlshr x!62753 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493128 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493128 #b00000000000000000000000000000000))))))

(assert (=> d!99949 (= (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (bvand (bvxor lt!325258 (bvlshr lt!325258 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733570 d!99949))

(declare-fun d!99951 () Bool)

(declare-fun lt!325267 () (_ BitVec 32))

(assert (=> d!99951 (and (bvsge lt!325267 #b00000000000000000000000000000000) (bvslt lt!325267 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99951 (= lt!325267 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99951 (validMask!0 mask!3328)))

(assert (=> d!99951 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325267)))

(declare-fun bs!20974 () Bool)

(assert (= bs!20974 d!99951))

(declare-fun m!686675 () Bool)

(assert (=> bs!20974 m!686675))

(assert (=> bs!20974 m!686451))

(assert (=> b!733569 d!99951))

(declare-fun b!733894 () Bool)

(declare-fun e!410639 () Bool)

(declare-fun e!410638 () Bool)

(assert (=> b!733894 (= e!410639 e!410638)))

(declare-fun c!80750 () Bool)

(assert (=> b!733894 (= c!80750 (validKeyInArray!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99953 () Bool)

(declare-fun res!493151 () Bool)

(assert (=> d!99953 (=> res!493151 e!410639)))

(assert (=> d!99953 (= res!493151 (bvsge #b00000000000000000000000000000000 (size!20169 a!3186)))))

(assert (=> d!99953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410639)))

(declare-fun b!733895 () Bool)

(declare-fun e!410637 () Bool)

(assert (=> b!733895 (= e!410638 e!410637)))

(declare-fun lt!325270 () (_ BitVec 64))

(assert (=> b!733895 (= lt!325270 (select (arr!19748 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325269 () Unit!25014)

(assert (=> b!733895 (= lt!325269 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325270 #b00000000000000000000000000000000))))

(assert (=> b!733895 (arrayContainsKey!0 a!3186 lt!325270 #b00000000000000000000000000000000)))

(declare-fun lt!325268 () Unit!25014)

(assert (=> b!733895 (= lt!325268 lt!325269)))

(declare-fun res!493152 () Bool)

(assert (=> b!733895 (= res!493152 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7348 #b00000000000000000000000000000000)))))

(assert (=> b!733895 (=> (not res!493152) (not e!410637))))

(declare-fun b!733896 () Bool)

(declare-fun call!34885 () Bool)

(assert (=> b!733896 (= e!410638 call!34885)))

(declare-fun bm!34882 () Bool)

(assert (=> bm!34882 (= call!34885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733897 () Bool)

(assert (=> b!733897 (= e!410637 call!34885)))

(assert (= (and d!99953 (not res!493151)) b!733894))

(assert (= (and b!733894 c!80750) b!733895))

(assert (= (and b!733894 (not c!80750)) b!733896))

(assert (= (and b!733895 res!493152) b!733897))

(assert (= (or b!733897 b!733896) bm!34882))

(assert (=> b!733894 m!686543))

(assert (=> b!733894 m!686543))

(assert (=> b!733894 m!686663))

(assert (=> b!733895 m!686543))

(declare-fun m!686677 () Bool)

(assert (=> b!733895 m!686677))

(declare-fun m!686679 () Bool)

(assert (=> b!733895 m!686679))

(assert (=> b!733895 m!686543))

(declare-fun m!686681 () Bool)

(assert (=> b!733895 m!686681))

(declare-fun m!686683 () Bool)

(assert (=> bm!34882 m!686683))

(assert (=> b!733568 d!99953))

(declare-fun d!99955 () Bool)

(assert (=> d!99955 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733578 d!99955))

(declare-fun b!733898 () Bool)

(declare-fun e!410642 () SeekEntryResult!7348)

(declare-fun e!410641 () SeekEntryResult!7348)

(assert (=> b!733898 (= e!410642 e!410641)))

(declare-fun lt!325273 () (_ BitVec 64))

(declare-fun lt!325271 () SeekEntryResult!7348)

(assert (=> b!733898 (= lt!325273 (select (arr!19748 a!3186) (index!31762 lt!325271)))))

(declare-fun c!80753 () Bool)

(assert (=> b!733898 (= c!80753 (= lt!325273 (select (arr!19748 a!3186) j!159)))))

(declare-fun b!733899 () Bool)

(assert (=> b!733899 (= e!410641 (Found!7348 (index!31762 lt!325271)))))

(declare-fun b!733900 () Bool)

(declare-fun e!410640 () SeekEntryResult!7348)

(assert (=> b!733900 (= e!410640 (MissingZero!7348 (index!31762 lt!325271)))))

(declare-fun b!733901 () Bool)

(declare-fun c!80751 () Bool)

(assert (=> b!733901 (= c!80751 (= lt!325273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733901 (= e!410641 e!410640)))

(declare-fun b!733902 () Bool)

(assert (=> b!733902 (= e!410640 (seekKeyOrZeroReturnVacant!0 (x!62746 lt!325271) (index!31762 lt!325271) (index!31762 lt!325271) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99957 () Bool)

(declare-fun lt!325272 () SeekEntryResult!7348)

(assert (=> d!99957 (and (or (is-Undefined!7348 lt!325272) (not (is-Found!7348 lt!325272)) (and (bvsge (index!31761 lt!325272) #b00000000000000000000000000000000) (bvslt (index!31761 lt!325272) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325272) (is-Found!7348 lt!325272) (not (is-MissingZero!7348 lt!325272)) (and (bvsge (index!31760 lt!325272) #b00000000000000000000000000000000) (bvslt (index!31760 lt!325272) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325272) (is-Found!7348 lt!325272) (is-MissingZero!7348 lt!325272) (not (is-MissingVacant!7348 lt!325272)) (and (bvsge (index!31763 lt!325272) #b00000000000000000000000000000000) (bvslt (index!31763 lt!325272) (size!20169 a!3186)))) (or (is-Undefined!7348 lt!325272) (ite (is-Found!7348 lt!325272) (= (select (arr!19748 a!3186) (index!31761 lt!325272)) (select (arr!19748 a!3186) j!159)) (ite (is-MissingZero!7348 lt!325272) (= (select (arr!19748 a!3186) (index!31760 lt!325272)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7348 lt!325272) (= (select (arr!19748 a!3186) (index!31763 lt!325272)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99957 (= lt!325272 e!410642)))

(declare-fun c!80752 () Bool)

(assert (=> d!99957 (= c!80752 (and (is-Intermediate!7348 lt!325271) (undefined!8160 lt!325271)))))

(assert (=> d!99957 (= lt!325271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19748 a!3186) j!159) mask!3328) (select (arr!19748 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99957 (validMask!0 mask!3328)))

(assert (=> d!99957 (= (seekEntryOrOpen!0 (select (arr!19748 a!3186) j!159) a!3186 mask!3328) lt!325272)))

(declare-fun b!733903 () Bool)

(assert (=> b!733903 (= e!410642 Undefined!7348)))

(assert (= (and d!99957 c!80752) b!733903))

(assert (= (and d!99957 (not c!80752)) b!733898))

(assert (= (and b!733898 c!80753) b!733899))

(assert (= (and b!733898 (not c!80753)) b!733901))

(assert (= (and b!733901 c!80751) b!733900))

(assert (= (and b!733901 (not c!80751)) b!733902))

(declare-fun m!686685 () Bool)

(assert (=> b!733898 m!686685))

(assert (=> b!733902 m!686431))

(declare-fun m!686687 () Bool)

(assert (=> b!733902 m!686687))

(assert (=> d!99957 m!686439))

(assert (=> d!99957 m!686431))

(assert (=> d!99957 m!686441))

(assert (=> d!99957 m!686431))

(assert (=> d!99957 m!686439))

(declare-fun m!686689 () Bool)

(assert (=> d!99957 m!686689))

(assert (=> d!99957 m!686451))

(declare-fun m!686691 () Bool)

(assert (=> d!99957 m!686691))

(declare-fun m!686693 () Bool)

