; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65716 () Bool)

(assert start!65716)

(declare-fun b!754115 () Bool)

(declare-fun res!509531 () Bool)

(declare-fun e!420588 () Bool)

(assert (=> b!754115 (=> (not res!509531) (not e!420588))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41889 0))(
  ( (array!41890 (arr!20058 (Array (_ BitVec 32) (_ BitVec 64))) (size!20479 (_ BitVec 32))) )
))
(declare-fun lt!335582 () array!41889)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7658 0))(
  ( (MissingZero!7658 (index!33000 (_ BitVec 32))) (Found!7658 (index!33001 (_ BitVec 32))) (Intermediate!7658 (undefined!8470 Bool) (index!33002 (_ BitVec 32)) (x!63912 (_ BitVec 32))) (Undefined!7658) (MissingVacant!7658 (index!33003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41889 (_ BitVec 32)) SeekEntryResult!7658)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41889 (_ BitVec 32)) SeekEntryResult!7658)

(assert (=> b!754115 (= res!509531 (= (seekEntryOrOpen!0 lt!335581 lt!335582 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335581 lt!335582 mask!3328)))))

(declare-fun b!754116 () Bool)

(declare-fun e!420582 () Bool)

(declare-fun e!420583 () Bool)

(assert (=> b!754116 (= e!420582 e!420583)))

(declare-fun res!509537 () Bool)

(assert (=> b!754116 (=> res!509537 e!420583)))

(declare-fun lt!335578 () SeekEntryResult!7658)

(declare-fun lt!335580 () SeekEntryResult!7658)

(assert (=> b!754116 (= res!509537 (not (= lt!335578 lt!335580)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!41889)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754116 (= lt!335578 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20058 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754117 () Bool)

(declare-fun res!509530 () Bool)

(declare-fun e!420591 () Bool)

(assert (=> b!754117 (=> (not res!509530) (not e!420591))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754117 (= res!509530 (and (= (size!20479 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20479 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20479 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754118 () Bool)

(declare-fun res!509535 () Bool)

(declare-fun e!420586 () Bool)

(assert (=> b!754118 (=> (not res!509535) (not e!420586))))

(declare-fun e!420592 () Bool)

(assert (=> b!754118 (= res!509535 e!420592)))

(declare-fun c!82678 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754118 (= c!82678 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754119 () Bool)

(declare-fun res!509529 () Bool)

(declare-fun e!420593 () Bool)

(assert (=> b!754119 (=> (not res!509529) (not e!420593))))

(assert (=> b!754119 (= res!509529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20479 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20479 a!3186))))))

(declare-fun res!509524 () Bool)

(assert (=> start!65716 (=> (not res!509524) (not e!420591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65716 (= res!509524 (validMask!0 mask!3328))))

(assert (=> start!65716 e!420591))

(assert (=> start!65716 true))

(declare-fun array_inv!15854 (array!41889) Bool)

(assert (=> start!65716 (array_inv!15854 a!3186)))

(declare-fun b!754120 () Bool)

(declare-datatypes ((Unit!26012 0))(
  ( (Unit!26013) )
))
(declare-fun e!420589 () Unit!26012)

(declare-fun Unit!26014 () Unit!26012)

(assert (=> b!754120 (= e!420589 Unit!26014)))

(assert (=> b!754120 false))

(declare-fun b!754121 () Bool)

(assert (=> b!754121 (= e!420592 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20058 a!3186) j!159) a!3186 mask!3328) (Found!7658 j!159)))))

(declare-fun b!754122 () Bool)

(declare-fun res!509523 () Bool)

(assert (=> b!754122 (=> (not res!509523) (not e!420593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41889 (_ BitVec 32)) Bool)

(assert (=> b!754122 (= res!509523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!420590 () Bool)

(declare-fun b!754123 () Bool)

(assert (=> b!754123 (= e!420590 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20058 a!3186) j!159) a!3186 mask!3328) lt!335580))))

(declare-fun b!754124 () Bool)

(assert (=> b!754124 (= e!420593 e!420586)))

(declare-fun res!509540 () Bool)

(assert (=> b!754124 (=> (not res!509540) (not e!420586))))

(declare-fun lt!335583 () SeekEntryResult!7658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41889 (_ BitVec 32)) SeekEntryResult!7658)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754124 (= res!509540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20058 a!3186) j!159) mask!3328) (select (arr!20058 a!3186) j!159) a!3186 mask!3328) lt!335583))))

(assert (=> b!754124 (= lt!335583 (Intermediate!7658 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754125 () Bool)

(declare-fun res!509539 () Bool)

(assert (=> b!754125 (=> (not res!509539) (not e!420593))))

(declare-datatypes ((List!14060 0))(
  ( (Nil!14057) (Cons!14056 (h!15128 (_ BitVec 64)) (t!20375 List!14060)) )
))
(declare-fun arrayNoDuplicates!0 (array!41889 (_ BitVec 32) List!14060) Bool)

(assert (=> b!754125 (= res!509539 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14057))))

(declare-fun b!754126 () Bool)

(declare-fun res!509527 () Bool)

(assert (=> b!754126 (=> (not res!509527) (not e!420586))))

(assert (=> b!754126 (= res!509527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20058 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754127 () Bool)

(declare-fun e!420584 () Bool)

(assert (=> b!754127 (= e!420586 e!420584)))

(declare-fun res!509532 () Bool)

(assert (=> b!754127 (=> (not res!509532) (not e!420584))))

(declare-fun lt!335585 () SeekEntryResult!7658)

(declare-fun lt!335579 () SeekEntryResult!7658)

(assert (=> b!754127 (= res!509532 (= lt!335585 lt!335579))))

(assert (=> b!754127 (= lt!335579 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335581 lt!335582 mask!3328))))

(assert (=> b!754127 (= lt!335585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335581 mask!3328) lt!335581 lt!335582 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!754127 (= lt!335581 (select (store (arr!20058 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754127 (= lt!335582 (array!41890 (store (arr!20058 a!3186) i!1173 k!2102) (size!20479 a!3186)))))

(declare-fun b!754128 () Bool)

(declare-fun res!509522 () Bool)

(assert (=> b!754128 (=> (not res!509522) (not e!420591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754128 (= res!509522 (validKeyInArray!0 (select (arr!20058 a!3186) j!159)))))

(declare-fun b!754129 () Bool)

(declare-fun Unit!26015 () Unit!26012)

(assert (=> b!754129 (= e!420589 Unit!26015)))

(declare-fun b!754130 () Bool)

(declare-fun res!509533 () Bool)

(assert (=> b!754130 (=> (not res!509533) (not e!420591))))

(assert (=> b!754130 (= res!509533 (validKeyInArray!0 k!2102))))

(declare-fun b!754131 () Bool)

(assert (=> b!754131 (= e!420592 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20058 a!3186) j!159) a!3186 mask!3328) lt!335583))))

(declare-fun b!754132 () Bool)

(declare-fun lt!335575 () SeekEntryResult!7658)

(assert (=> b!754132 (= e!420588 (= lt!335575 lt!335578))))

(declare-fun b!754133 () Bool)

(declare-fun res!509525 () Bool)

(assert (=> b!754133 (=> (not res!509525) (not e!420591))))

(declare-fun arrayContainsKey!0 (array!41889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754133 (= res!509525 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754134 () Bool)

(assert (=> b!754134 (= e!420591 e!420593)))

(declare-fun res!509538 () Bool)

(assert (=> b!754134 (=> (not res!509538) (not e!420593))))

(declare-fun lt!335577 () SeekEntryResult!7658)

(assert (=> b!754134 (= res!509538 (or (= lt!335577 (MissingZero!7658 i!1173)) (= lt!335577 (MissingVacant!7658 i!1173))))))

(assert (=> b!754134 (= lt!335577 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754135 () Bool)

(declare-fun e!420587 () Bool)

(assert (=> b!754135 (= e!420587 true)))

(assert (=> b!754135 e!420588))

(declare-fun res!509526 () Bool)

(assert (=> b!754135 (=> (not res!509526) (not e!420588))))

(declare-fun lt!335584 () (_ BitVec 64))

(assert (=> b!754135 (= res!509526 (= lt!335584 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335576 () Unit!26012)

(assert (=> b!754135 (= lt!335576 e!420589)))

(declare-fun c!82677 () Bool)

(assert (=> b!754135 (= c!82677 (= lt!335584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754136 () Bool)

(assert (=> b!754136 (= e!420583 e!420587)))

(declare-fun res!509534 () Bool)

(assert (=> b!754136 (=> res!509534 e!420587)))

(assert (=> b!754136 (= res!509534 (= lt!335584 lt!335581))))

(assert (=> b!754136 (= lt!335584 (select (store (arr!20058 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754137 () Bool)

(assert (=> b!754137 (= e!420584 (not e!420582))))

(declare-fun res!509528 () Bool)

(assert (=> b!754137 (=> res!509528 e!420582)))

(assert (=> b!754137 (= res!509528 (or (not (is-Intermediate!7658 lt!335579)) (bvslt x!1131 (x!63912 lt!335579)) (not (= x!1131 (x!63912 lt!335579))) (not (= index!1321 (index!33002 lt!335579)))))))

(assert (=> b!754137 e!420590))

(declare-fun res!509536 () Bool)

(assert (=> b!754137 (=> (not res!509536) (not e!420590))))

(assert (=> b!754137 (= res!509536 (= lt!335575 lt!335580))))

(assert (=> b!754137 (= lt!335580 (Found!7658 j!159))))

(assert (=> b!754137 (= lt!335575 (seekEntryOrOpen!0 (select (arr!20058 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754137 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335574 () Unit!26012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26012)

(assert (=> b!754137 (= lt!335574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65716 res!509524) b!754117))

(assert (= (and b!754117 res!509530) b!754128))

(assert (= (and b!754128 res!509522) b!754130))

(assert (= (and b!754130 res!509533) b!754133))

(assert (= (and b!754133 res!509525) b!754134))

(assert (= (and b!754134 res!509538) b!754122))

(assert (= (and b!754122 res!509523) b!754125))

(assert (= (and b!754125 res!509539) b!754119))

(assert (= (and b!754119 res!509529) b!754124))

(assert (= (and b!754124 res!509540) b!754126))

(assert (= (and b!754126 res!509527) b!754118))

(assert (= (and b!754118 c!82678) b!754131))

(assert (= (and b!754118 (not c!82678)) b!754121))

(assert (= (and b!754118 res!509535) b!754127))

(assert (= (and b!754127 res!509532) b!754137))

(assert (= (and b!754137 res!509536) b!754123))

(assert (= (and b!754137 (not res!509528)) b!754116))

(assert (= (and b!754116 (not res!509537)) b!754136))

(assert (= (and b!754136 (not res!509534)) b!754135))

(assert (= (and b!754135 c!82677) b!754120))

(assert (= (and b!754135 (not c!82677)) b!754129))

(assert (= (and b!754135 res!509526) b!754115))

(assert (= (and b!754115 res!509531) b!754132))

(declare-fun m!702643 () Bool)

(assert (=> b!754130 m!702643))

(declare-fun m!702645 () Bool)

(assert (=> b!754128 m!702645))

(assert (=> b!754128 m!702645))

(declare-fun m!702647 () Bool)

(assert (=> b!754128 m!702647))

(assert (=> b!754137 m!702645))

(assert (=> b!754137 m!702645))

(declare-fun m!702649 () Bool)

(assert (=> b!754137 m!702649))

(declare-fun m!702651 () Bool)

(assert (=> b!754137 m!702651))

(declare-fun m!702653 () Bool)

(assert (=> b!754137 m!702653))

(assert (=> b!754124 m!702645))

(assert (=> b!754124 m!702645))

(declare-fun m!702655 () Bool)

(assert (=> b!754124 m!702655))

(assert (=> b!754124 m!702655))

(assert (=> b!754124 m!702645))

(declare-fun m!702657 () Bool)

(assert (=> b!754124 m!702657))

(assert (=> b!754116 m!702645))

(assert (=> b!754116 m!702645))

(declare-fun m!702659 () Bool)

(assert (=> b!754116 m!702659))

(declare-fun m!702661 () Bool)

(assert (=> b!754126 m!702661))

(assert (=> b!754121 m!702645))

(assert (=> b!754121 m!702645))

(assert (=> b!754121 m!702659))

(declare-fun m!702663 () Bool)

(assert (=> b!754127 m!702663))

(declare-fun m!702665 () Bool)

(assert (=> b!754127 m!702665))

(declare-fun m!702667 () Bool)

(assert (=> b!754127 m!702667))

(assert (=> b!754127 m!702665))

(declare-fun m!702669 () Bool)

(assert (=> b!754127 m!702669))

(declare-fun m!702671 () Bool)

(assert (=> b!754127 m!702671))

(declare-fun m!702673 () Bool)

(assert (=> b!754133 m!702673))

(assert (=> b!754131 m!702645))

(assert (=> b!754131 m!702645))

(declare-fun m!702675 () Bool)

(assert (=> b!754131 m!702675))

(declare-fun m!702677 () Bool)

(assert (=> b!754115 m!702677))

(declare-fun m!702679 () Bool)

(assert (=> b!754115 m!702679))

(declare-fun m!702681 () Bool)

(assert (=> start!65716 m!702681))

(declare-fun m!702683 () Bool)

(assert (=> start!65716 m!702683))

(declare-fun m!702685 () Bool)

(assert (=> b!754134 m!702685))

(declare-fun m!702687 () Bool)

(assert (=> b!754122 m!702687))

(declare-fun m!702689 () Bool)

(assert (=> b!754125 m!702689))

(assert (=> b!754123 m!702645))

(assert (=> b!754123 m!702645))

(declare-fun m!702691 () Bool)

(assert (=> b!754123 m!702691))

(assert (=> b!754136 m!702669))

(declare-fun m!702693 () Bool)

(assert (=> b!754136 m!702693))

(push 1)

