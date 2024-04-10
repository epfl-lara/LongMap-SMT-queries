; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67548 () Bool)

(assert start!67548)

(declare-fun b!781573 () Bool)

(declare-datatypes ((Unit!26948 0))(
  ( (Unit!26949) )
))
(declare-fun e!434701 () Unit!26948)

(declare-fun Unit!26950 () Unit!26948)

(assert (=> b!781573 (= e!434701 Unit!26950)))

(declare-fun b!781574 () Bool)

(declare-fun res!528747 () Bool)

(declare-fun e!434705 () Bool)

(assert (=> b!781574 (=> (not res!528747) (not e!434705))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42651 0))(
  ( (array!42652 (arr!20415 (Array (_ BitVec 32) (_ BitVec 64))) (size!20836 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42651)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781574 (= res!528747 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20415 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781575 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!434700 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8015 0))(
  ( (MissingZero!8015 (index!34428 (_ BitVec 32))) (Found!8015 (index!34429 (_ BitVec 32))) (Intermediate!8015 (undefined!8827 Bool) (index!34430 (_ BitVec 32)) (x!65386 (_ BitVec 32))) (Undefined!8015) (MissingVacant!8015 (index!34431 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42651 (_ BitVec 32)) SeekEntryResult!8015)

(assert (=> b!781575 (= e!434700 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20415 a!3186) j!159) a!3186 mask!3328) (Found!8015 j!159)))))

(declare-fun b!781576 () Bool)

(declare-fun res!528741 () Bool)

(declare-fun e!434706 () Bool)

(assert (=> b!781576 (=> (not res!528741) (not e!434706))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781576 (= res!528741 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20836 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20836 a!3186))))))

(declare-fun b!781577 () Bool)

(declare-fun lt!348293 () SeekEntryResult!8015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42651 (_ BitVec 32)) SeekEntryResult!8015)

(assert (=> b!781577 (= e!434700 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20415 a!3186) j!159) a!3186 mask!3328) lt!348293))))

(declare-fun b!781578 () Bool)

(declare-fun e!434707 () Bool)

(assert (=> b!781578 (= e!434705 e!434707)))

(declare-fun res!528751 () Bool)

(assert (=> b!781578 (=> (not res!528751) (not e!434707))))

(declare-fun lt!348297 () SeekEntryResult!8015)

(declare-fun lt!348294 () SeekEntryResult!8015)

(assert (=> b!781578 (= res!528751 (= lt!348297 lt!348294))))

(declare-fun lt!348299 () (_ BitVec 64))

(declare-fun lt!348290 () array!42651)

(assert (=> b!781578 (= lt!348294 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348299 lt!348290 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781578 (= lt!348297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348299 mask!3328) lt!348299 lt!348290 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!781578 (= lt!348299 (select (store (arr!20415 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781578 (= lt!348290 (array!42652 (store (arr!20415 a!3186) i!1173 k!2102) (size!20836 a!3186)))))

(declare-fun b!781579 () Bool)

(declare-fun Unit!26951 () Unit!26948)

(assert (=> b!781579 (= e!434701 Unit!26951)))

(assert (=> b!781579 false))

(declare-fun b!781580 () Bool)

(declare-fun res!528743 () Bool)

(assert (=> b!781580 (=> (not res!528743) (not e!434706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42651 (_ BitVec 32)) Bool)

(assert (=> b!781580 (= res!528743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781581 () Bool)

(declare-fun res!528739 () Bool)

(assert (=> b!781581 (=> (not res!528739) (not e!434705))))

(assert (=> b!781581 (= res!528739 e!434700)))

(declare-fun c!86824 () Bool)

(assert (=> b!781581 (= c!86824 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781582 () Bool)

(declare-fun e!434702 () Bool)

(assert (=> b!781582 (= e!434707 (not e!434702))))

(declare-fun res!528745 () Bool)

(assert (=> b!781582 (=> res!528745 e!434702)))

(assert (=> b!781582 (= res!528745 (or (not (is-Intermediate!8015 lt!348294)) (bvslt x!1131 (x!65386 lt!348294)) (not (= x!1131 (x!65386 lt!348294))) (not (= index!1321 (index!34430 lt!348294)))))))

(declare-fun e!434703 () Bool)

(assert (=> b!781582 e!434703))

(declare-fun res!528753 () Bool)

(assert (=> b!781582 (=> (not res!528753) (not e!434703))))

(declare-fun lt!348296 () SeekEntryResult!8015)

(declare-fun lt!348295 () SeekEntryResult!8015)

(assert (=> b!781582 (= res!528753 (= lt!348296 lt!348295))))

(assert (=> b!781582 (= lt!348295 (Found!8015 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42651 (_ BitVec 32)) SeekEntryResult!8015)

(assert (=> b!781582 (= lt!348296 (seekEntryOrOpen!0 (select (arr!20415 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781582 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348292 () Unit!26948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26948)

(assert (=> b!781582 (= lt!348292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781583 () Bool)

(declare-fun res!528748 () Bool)

(assert (=> b!781583 (=> res!528748 e!434702)))

(assert (=> b!781583 (= res!528748 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20415 a!3186) j!159) a!3186 mask!3328) lt!348295)))))

(declare-fun b!781585 () Bool)

(declare-fun res!528742 () Bool)

(declare-fun e!434708 () Bool)

(assert (=> b!781585 (=> (not res!528742) (not e!434708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781585 (= res!528742 (validKeyInArray!0 (select (arr!20415 a!3186) j!159)))))

(declare-fun b!781586 () Bool)

(assert (=> b!781586 (= e!434703 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20415 a!3186) j!159) a!3186 mask!3328) lt!348295))))

(declare-fun b!781587 () Bool)

(declare-fun res!528752 () Bool)

(assert (=> b!781587 (=> (not res!528752) (not e!434706))))

(declare-datatypes ((List!14417 0))(
  ( (Nil!14414) (Cons!14413 (h!15533 (_ BitVec 64)) (t!20732 List!14417)) )
))
(declare-fun arrayNoDuplicates!0 (array!42651 (_ BitVec 32) List!14417) Bool)

(assert (=> b!781587 (= res!528752 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14414))))

(declare-fun b!781588 () Bool)

(declare-fun res!528740 () Bool)

(assert (=> b!781588 (=> res!528740 e!434702)))

(assert (=> b!781588 (= res!528740 (= (select (store (arr!20415 a!3186) i!1173 k!2102) index!1321) lt!348299))))

(declare-fun b!781589 () Bool)

(declare-fun res!528750 () Bool)

(assert (=> b!781589 (=> (not res!528750) (not e!434708))))

(assert (=> b!781589 (= res!528750 (and (= (size!20836 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20836 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20836 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781590 () Bool)

(declare-fun res!528746 () Bool)

(assert (=> b!781590 (=> (not res!528746) (not e!434708))))

(assert (=> b!781590 (= res!528746 (validKeyInArray!0 k!2102))))

(declare-fun b!781591 () Bool)

(assert (=> b!781591 (= e!434706 e!434705)))

(declare-fun res!528755 () Bool)

(assert (=> b!781591 (=> (not res!528755) (not e!434705))))

(assert (=> b!781591 (= res!528755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20415 a!3186) j!159) mask!3328) (select (arr!20415 a!3186) j!159) a!3186 mask!3328) lt!348293))))

(assert (=> b!781591 (= lt!348293 (Intermediate!8015 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781584 () Bool)

(declare-fun res!528749 () Bool)

(assert (=> b!781584 (=> (not res!528749) (not e!434708))))

(declare-fun arrayContainsKey!0 (array!42651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781584 (= res!528749 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!528744 () Bool)

(assert (=> start!67548 (=> (not res!528744) (not e!434708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67548 (= res!528744 (validMask!0 mask!3328))))

(assert (=> start!67548 e!434708))

(assert (=> start!67548 true))

(declare-fun array_inv!16211 (array!42651) Bool)

(assert (=> start!67548 (array_inv!16211 a!3186)))

(declare-fun b!781592 () Bool)

(assert (=> b!781592 (= e!434708 e!434706)))

(declare-fun res!528754 () Bool)

(assert (=> b!781592 (=> (not res!528754) (not e!434706))))

(declare-fun lt!348298 () SeekEntryResult!8015)

(assert (=> b!781592 (= res!528754 (or (= lt!348298 (MissingZero!8015 i!1173)) (= lt!348298 (MissingVacant!8015 i!1173))))))

(assert (=> b!781592 (= lt!348298 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781593 () Bool)

(assert (=> b!781593 (= e!434702 true)))

(assert (=> b!781593 (= (select (store (arr!20415 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348291 () Unit!26948)

(assert (=> b!781593 (= lt!348291 e!434701)))

(declare-fun c!86823 () Bool)

(assert (=> b!781593 (= c!86823 (= (select (store (arr!20415 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67548 res!528744) b!781589))

(assert (= (and b!781589 res!528750) b!781585))

(assert (= (and b!781585 res!528742) b!781590))

(assert (= (and b!781590 res!528746) b!781584))

(assert (= (and b!781584 res!528749) b!781592))

(assert (= (and b!781592 res!528754) b!781580))

(assert (= (and b!781580 res!528743) b!781587))

(assert (= (and b!781587 res!528752) b!781576))

(assert (= (and b!781576 res!528741) b!781591))

(assert (= (and b!781591 res!528755) b!781574))

(assert (= (and b!781574 res!528747) b!781581))

(assert (= (and b!781581 c!86824) b!781577))

(assert (= (and b!781581 (not c!86824)) b!781575))

(assert (= (and b!781581 res!528739) b!781578))

(assert (= (and b!781578 res!528751) b!781582))

(assert (= (and b!781582 res!528753) b!781586))

(assert (= (and b!781582 (not res!528745)) b!781583))

(assert (= (and b!781583 (not res!528748)) b!781588))

(assert (= (and b!781588 (not res!528740)) b!781593))

(assert (= (and b!781593 c!86823) b!781579))

(assert (= (and b!781593 (not c!86823)) b!781573))

(declare-fun m!724571 () Bool)

(assert (=> b!781587 m!724571))

(declare-fun m!724573 () Bool)

(assert (=> b!781577 m!724573))

(assert (=> b!781577 m!724573))

(declare-fun m!724575 () Bool)

(assert (=> b!781577 m!724575))

(declare-fun m!724577 () Bool)

(assert (=> b!781588 m!724577))

(declare-fun m!724579 () Bool)

(assert (=> b!781588 m!724579))

(assert (=> b!781582 m!724573))

(assert (=> b!781582 m!724573))

(declare-fun m!724581 () Bool)

(assert (=> b!781582 m!724581))

(declare-fun m!724583 () Bool)

(assert (=> b!781582 m!724583))

(declare-fun m!724585 () Bool)

(assert (=> b!781582 m!724585))

(assert (=> b!781583 m!724573))

(assert (=> b!781583 m!724573))

(declare-fun m!724587 () Bool)

(assert (=> b!781583 m!724587))

(assert (=> b!781586 m!724573))

(assert (=> b!781586 m!724573))

(declare-fun m!724589 () Bool)

(assert (=> b!781586 m!724589))

(assert (=> b!781593 m!724577))

(assert (=> b!781593 m!724579))

(assert (=> b!781575 m!724573))

(assert (=> b!781575 m!724573))

(assert (=> b!781575 m!724587))

(assert (=> b!781585 m!724573))

(assert (=> b!781585 m!724573))

(declare-fun m!724591 () Bool)

(assert (=> b!781585 m!724591))

(declare-fun m!724593 () Bool)

(assert (=> b!781580 m!724593))

(declare-fun m!724595 () Bool)

(assert (=> start!67548 m!724595))

(declare-fun m!724597 () Bool)

(assert (=> start!67548 m!724597))

(declare-fun m!724599 () Bool)

(assert (=> b!781578 m!724599))

(assert (=> b!781578 m!724577))

(declare-fun m!724601 () Bool)

(assert (=> b!781578 m!724601))

(declare-fun m!724603 () Bool)

(assert (=> b!781578 m!724603))

(assert (=> b!781578 m!724603))

(declare-fun m!724605 () Bool)

(assert (=> b!781578 m!724605))

(declare-fun m!724607 () Bool)

(assert (=> b!781574 m!724607))

(declare-fun m!724609 () Bool)

(assert (=> b!781592 m!724609))

(declare-fun m!724611 () Bool)

(assert (=> b!781584 m!724611))

(assert (=> b!781591 m!724573))

(assert (=> b!781591 m!724573))

(declare-fun m!724613 () Bool)

(assert (=> b!781591 m!724613))

(assert (=> b!781591 m!724613))

(assert (=> b!781591 m!724573))

(declare-fun m!724615 () Bool)

(assert (=> b!781591 m!724615))

(declare-fun m!724617 () Bool)

(assert (=> b!781590 m!724617))

(push 1)

