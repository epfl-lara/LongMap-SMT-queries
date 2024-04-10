; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67024 () Bool)

(assert start!67024)

(declare-fun b!773744 () Bool)

(declare-fun res!523317 () Bool)

(declare-fun e!430701 () Bool)

(assert (=> b!773744 (=> (not res!523317) (not e!430701))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773744 (= res!523317 (validKeyInArray!0 k!2102))))

(declare-fun b!773745 () Bool)

(declare-fun e!430702 () Bool)

(declare-fun e!430703 () Bool)

(assert (=> b!773745 (= e!430702 e!430703)))

(declare-fun res!523318 () Bool)

(assert (=> b!773745 (=> (not res!523318) (not e!430703))))

(declare-datatypes ((SeekEntryResult!7921 0))(
  ( (MissingZero!7921 (index!34052 (_ BitVec 32))) (Found!7921 (index!34053 (_ BitVec 32))) (Intermediate!7921 (undefined!8733 Bool) (index!34054 (_ BitVec 32)) (x!64988 (_ BitVec 32))) (Undefined!7921) (MissingVacant!7921 (index!34055 (_ BitVec 32))) )
))
(declare-fun lt!344587 () SeekEntryResult!7921)

(declare-fun lt!344591 () SeekEntryResult!7921)

(assert (=> b!773745 (= res!523318 (= lt!344587 lt!344591))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42448 0))(
  ( (array!42449 (arr!20321 (Array (_ BitVec 32) (_ BitVec 64))) (size!20742 (_ BitVec 32))) )
))
(declare-fun lt!344584 () array!42448)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!344579 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!773745 (= lt!344591 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344579 lt!344584 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773745 (= lt!344587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344579 mask!3328) lt!344579 lt!344584 mask!3328))))

(declare-fun a!3186 () array!42448)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773745 (= lt!344579 (select (store (arr!20321 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773745 (= lt!344584 (array!42449 (store (arr!20321 a!3186) i!1173 k!2102) (size!20742 a!3186)))))

(declare-fun b!773746 () Bool)

(declare-fun e!430700 () Bool)

(declare-fun e!430706 () Bool)

(assert (=> b!773746 (= e!430700 e!430706)))

(declare-fun res!523331 () Bool)

(assert (=> b!773746 (=> res!523331 e!430706)))

(declare-fun lt!344580 () (_ BitVec 32))

(assert (=> b!773746 (= res!523331 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344580 #b00000000000000000000000000000000) (bvsge lt!344580 (size!20742 a!3186))))))

(declare-datatypes ((Unit!26698 0))(
  ( (Unit!26699) )
))
(declare-fun lt!344585 () Unit!26698)

(declare-fun e!430699 () Unit!26698)

(assert (=> b!773746 (= lt!344585 e!430699)))

(declare-fun c!85615 () Bool)

(declare-fun lt!344589 () Bool)

(assert (=> b!773746 (= c!85615 lt!344589)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773746 (= lt!344589 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773746 (= lt!344580 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773747 () Bool)

(declare-fun Unit!26700 () Unit!26698)

(assert (=> b!773747 (= e!430699 Unit!26700)))

(declare-fun lt!344581 () SeekEntryResult!7921)

(assert (=> b!773747 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344580 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344581)))

(declare-fun b!773748 () Bool)

(declare-fun e!430707 () Bool)

(assert (=> b!773748 (= e!430707 e!430702)))

(declare-fun res!523326 () Bool)

(assert (=> b!773748 (=> (not res!523326) (not e!430702))))

(assert (=> b!773748 (= res!523326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344581))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!773748 (= lt!344581 (Intermediate!7921 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!430709 () Bool)

(declare-fun b!773749 () Bool)

(assert (=> b!773749 (= e!430709 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344581))))

(declare-fun b!773750 () Bool)

(declare-fun res!523327 () Bool)

(assert (=> b!773750 (=> (not res!523327) (not e!430701))))

(assert (=> b!773750 (= res!523327 (validKeyInArray!0 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773751 () Bool)

(declare-fun res!523325 () Bool)

(assert (=> b!773751 (=> (not res!523325) (not e!430702))))

(assert (=> b!773751 (= res!523325 e!430709)))

(declare-fun c!85613 () Bool)

(assert (=> b!773751 (= c!85613 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!430704 () Bool)

(declare-fun b!773753 () Bool)

(declare-fun lt!344582 () SeekEntryResult!7921)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!773753 (= e!430704 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344580 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344582))))

(declare-fun b!773754 () Bool)

(declare-fun Unit!26701 () Unit!26698)

(assert (=> b!773754 (= e!430699 Unit!26701)))

(declare-fun lt!344588 () SeekEntryResult!7921)

(assert (=> b!773754 (= lt!344588 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773754 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344580 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344582)))

(declare-fun b!773755 () Bool)

(assert (=> b!773755 (= e!430704 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344580 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344581))))

(declare-fun b!773756 () Bool)

(assert (=> b!773756 (= e!430706 e!430704)))

(declare-fun c!85614 () Bool)

(assert (=> b!773756 (= c!85614 lt!344589)))

(declare-fun b!773757 () Bool)

(assert (=> b!773757 (= e!430701 e!430707)))

(declare-fun res!523316 () Bool)

(assert (=> b!773757 (=> (not res!523316) (not e!430707))))

(declare-fun lt!344583 () SeekEntryResult!7921)

(assert (=> b!773757 (= res!523316 (or (= lt!344583 (MissingZero!7921 i!1173)) (= lt!344583 (MissingVacant!7921 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42448 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!773757 (= lt!344583 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773758 () Bool)

(declare-fun res!523323 () Bool)

(assert (=> b!773758 (=> (not res!523323) (not e!430707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42448 (_ BitVec 32)) Bool)

(assert (=> b!773758 (= res!523323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773759 () Bool)

(declare-fun res!523315 () Bool)

(assert (=> b!773759 (=> (not res!523315) (not e!430702))))

(assert (=> b!773759 (= res!523315 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20321 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!523328 () Bool)

(assert (=> start!67024 (=> (not res!523328) (not e!430701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67024 (= res!523328 (validMask!0 mask!3328))))

(assert (=> start!67024 e!430701))

(assert (=> start!67024 true))

(declare-fun array_inv!16117 (array!42448) Bool)

(assert (=> start!67024 (array_inv!16117 a!3186)))

(declare-fun e!430705 () Bool)

(declare-fun b!773752 () Bool)

(declare-fun lt!344590 () SeekEntryResult!7921)

(assert (=> b!773752 (= e!430705 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344590))))

(declare-fun b!773760 () Bool)

(assert (=> b!773760 (= e!430703 (not e!430700))))

(declare-fun res!523321 () Bool)

(assert (=> b!773760 (=> res!523321 e!430700)))

(assert (=> b!773760 (= res!523321 (or (not (is-Intermediate!7921 lt!344591)) (bvsge x!1131 (x!64988 lt!344591))))))

(assert (=> b!773760 (= lt!344582 (Found!7921 j!159))))

(declare-fun e!430708 () Bool)

(assert (=> b!773760 e!430708))

(declare-fun res!523324 () Bool)

(assert (=> b!773760 (=> (not res!523324) (not e!430708))))

(assert (=> b!773760 (= res!523324 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344586 () Unit!26698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26698)

(assert (=> b!773760 (= lt!344586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773761 () Bool)

(assert (=> b!773761 (= e!430709 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) (Found!7921 j!159)))))

(declare-fun b!773762 () Bool)

(declare-fun res!523330 () Bool)

(assert (=> b!773762 (=> (not res!523330) (not e!430701))))

(assert (=> b!773762 (= res!523330 (and (= (size!20742 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20742 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20742 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773763 () Bool)

(declare-fun res!523319 () Bool)

(assert (=> b!773763 (=> (not res!523319) (not e!430707))))

(assert (=> b!773763 (= res!523319 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20742 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20742 a!3186))))))

(declare-fun b!773764 () Bool)

(declare-fun res!523320 () Bool)

(assert (=> b!773764 (=> (not res!523320) (not e!430701))))

(declare-fun arrayContainsKey!0 (array!42448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773764 (= res!523320 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773765 () Bool)

(declare-fun res!523322 () Bool)

(assert (=> b!773765 (=> (not res!523322) (not e!430707))))

(declare-datatypes ((List!14323 0))(
  ( (Nil!14320) (Cons!14319 (h!15424 (_ BitVec 64)) (t!20638 List!14323)) )
))
(declare-fun arrayNoDuplicates!0 (array!42448 (_ BitVec 32) List!14323) Bool)

(assert (=> b!773765 (= res!523322 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14320))))

(declare-fun b!773766 () Bool)

(assert (=> b!773766 (= e!430708 e!430705)))

(declare-fun res!523329 () Bool)

(assert (=> b!773766 (=> (not res!523329) (not e!430705))))

(assert (=> b!773766 (= res!523329 (= (seekEntryOrOpen!0 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344590))))

(assert (=> b!773766 (= lt!344590 (Found!7921 j!159))))

(assert (= (and start!67024 res!523328) b!773762))

(assert (= (and b!773762 res!523330) b!773750))

(assert (= (and b!773750 res!523327) b!773744))

(assert (= (and b!773744 res!523317) b!773764))

(assert (= (and b!773764 res!523320) b!773757))

(assert (= (and b!773757 res!523316) b!773758))

(assert (= (and b!773758 res!523323) b!773765))

(assert (= (and b!773765 res!523322) b!773763))

(assert (= (and b!773763 res!523319) b!773748))

(assert (= (and b!773748 res!523326) b!773759))

(assert (= (and b!773759 res!523315) b!773751))

(assert (= (and b!773751 c!85613) b!773749))

(assert (= (and b!773751 (not c!85613)) b!773761))

(assert (= (and b!773751 res!523325) b!773745))

(assert (= (and b!773745 res!523318) b!773760))

(assert (= (and b!773760 res!523324) b!773766))

(assert (= (and b!773766 res!523329) b!773752))

(assert (= (and b!773760 (not res!523321)) b!773746))

(assert (= (and b!773746 c!85615) b!773747))

(assert (= (and b!773746 (not c!85615)) b!773754))

(assert (= (and b!773746 (not res!523331)) b!773756))

(assert (= (and b!773756 c!85614) b!773755))

(assert (= (and b!773756 (not c!85614)) b!773753))

(declare-fun m!718411 () Bool)

(assert (=> b!773758 m!718411))

(declare-fun m!718413 () Bool)

(assert (=> b!773764 m!718413))

(declare-fun m!718415 () Bool)

(assert (=> b!773752 m!718415))

(assert (=> b!773752 m!718415))

(declare-fun m!718417 () Bool)

(assert (=> b!773752 m!718417))

(assert (=> b!773747 m!718415))

(assert (=> b!773747 m!718415))

(declare-fun m!718419 () Bool)

(assert (=> b!773747 m!718419))

(assert (=> b!773755 m!718415))

(assert (=> b!773755 m!718415))

(assert (=> b!773755 m!718419))

(assert (=> b!773753 m!718415))

(assert (=> b!773753 m!718415))

(declare-fun m!718421 () Bool)

(assert (=> b!773753 m!718421))

(assert (=> b!773749 m!718415))

(assert (=> b!773749 m!718415))

(declare-fun m!718423 () Bool)

(assert (=> b!773749 m!718423))

(declare-fun m!718425 () Bool)

(assert (=> b!773759 m!718425))

(declare-fun m!718427 () Bool)

(assert (=> b!773760 m!718427))

(declare-fun m!718429 () Bool)

(assert (=> b!773760 m!718429))

(assert (=> b!773754 m!718415))

(assert (=> b!773754 m!718415))

(declare-fun m!718431 () Bool)

(assert (=> b!773754 m!718431))

(assert (=> b!773754 m!718415))

(assert (=> b!773754 m!718421))

(declare-fun m!718433 () Bool)

(assert (=> b!773765 m!718433))

(assert (=> b!773750 m!718415))

(assert (=> b!773750 m!718415))

(declare-fun m!718435 () Bool)

(assert (=> b!773750 m!718435))

(assert (=> b!773761 m!718415))

(assert (=> b!773761 m!718415))

(assert (=> b!773761 m!718431))

(declare-fun m!718437 () Bool)

(assert (=> b!773757 m!718437))

(declare-fun m!718439 () Bool)

(assert (=> b!773745 m!718439))

(declare-fun m!718441 () Bool)

(assert (=> b!773745 m!718441))

(assert (=> b!773745 m!718439))

(declare-fun m!718443 () Bool)

(assert (=> b!773745 m!718443))

(declare-fun m!718445 () Bool)

(assert (=> b!773745 m!718445))

(declare-fun m!718447 () Bool)

(assert (=> b!773745 m!718447))

(assert (=> b!773766 m!718415))

(assert (=> b!773766 m!718415))

(declare-fun m!718449 () Bool)

(assert (=> b!773766 m!718449))

(declare-fun m!718451 () Bool)

(assert (=> start!67024 m!718451))

(declare-fun m!718453 () Bool)

(assert (=> start!67024 m!718453))

(assert (=> b!773748 m!718415))

(assert (=> b!773748 m!718415))

(declare-fun m!718455 () Bool)

(assert (=> b!773748 m!718455))

(assert (=> b!773748 m!718455))

(assert (=> b!773748 m!718415))

(declare-fun m!718457 () Bool)

(assert (=> b!773748 m!718457))

(declare-fun m!718459 () Bool)

(assert (=> b!773744 m!718459))

(declare-fun m!718461 () Bool)

(assert (=> b!773746 m!718461))

(push 1)

(assert (not b!773749))

(assert (not b!773757))

