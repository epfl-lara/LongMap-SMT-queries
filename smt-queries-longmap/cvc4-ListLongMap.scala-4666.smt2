; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64916 () Bool)

(assert start!64916)

(declare-fun b!732524 () Bool)

(declare-fun e!409905 () Bool)

(declare-fun e!409909 () Bool)

(assert (=> b!732524 (= e!409905 e!409909)))

(declare-fun res!492108 () Bool)

(assert (=> b!732524 (=> res!492108 e!409909)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732524 (= res!492108 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324616 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732524 (= lt!324616 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732525 () Bool)

(declare-fun res!492106 () Bool)

(declare-fun e!409908 () Bool)

(assert (=> b!732525 (=> (not res!492106) (not e!409908))))

(declare-datatypes ((array!41227 0))(
  ( (array!41228 (arr!19730 (Array (_ BitVec 32) (_ BitVec 64))) (size!20151 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41227)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732525 (= res!492106 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732526 () Bool)

(declare-fun e!409902 () Bool)

(assert (=> b!732526 (= e!409902 (not e!409905))))

(declare-fun res!492116 () Bool)

(assert (=> b!732526 (=> res!492116 e!409905)))

(declare-datatypes ((SeekEntryResult!7330 0))(
  ( (MissingZero!7330 (index!31688 (_ BitVec 32))) (Found!7330 (index!31689 (_ BitVec 32))) (Intermediate!7330 (undefined!8142 Bool) (index!31690 (_ BitVec 32)) (x!62680 (_ BitVec 32))) (Undefined!7330) (MissingVacant!7330 (index!31691 (_ BitVec 32))) )
))
(declare-fun lt!324615 () SeekEntryResult!7330)

(assert (=> b!732526 (= res!492116 (or (not (is-Intermediate!7330 lt!324615)) (bvsge x!1131 (x!62680 lt!324615))))))

(declare-fun e!409906 () Bool)

(assert (=> b!732526 e!409906))

(declare-fun res!492120 () Bool)

(assert (=> b!732526 (=> (not res!492120) (not e!409906))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41227 (_ BitVec 32)) Bool)

(assert (=> b!732526 (= res!492120 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24978 0))(
  ( (Unit!24979) )
))
(declare-fun lt!324612 () Unit!24978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24978)

(assert (=> b!732526 (= lt!324612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732527 () Bool)

(declare-fun e!409901 () Bool)

(assert (=> b!732527 (= e!409908 e!409901)))

(declare-fun res!492107 () Bool)

(assert (=> b!732527 (=> (not res!492107) (not e!409901))))

(declare-fun lt!324614 () SeekEntryResult!7330)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732527 (= res!492107 (or (= lt!324614 (MissingZero!7330 i!1173)) (= lt!324614 (MissingVacant!7330 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732527 (= lt!324614 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732528 () Bool)

(declare-fun res!492115 () Bool)

(assert (=> b!732528 (=> (not res!492115) (not e!409901))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!732528 (= res!492115 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20151 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20151 a!3186))))))

(declare-fun b!732529 () Bool)

(declare-fun e!409903 () Bool)

(assert (=> b!732529 (= e!409906 e!409903)))

(declare-fun res!492109 () Bool)

(assert (=> b!732529 (=> (not res!492109) (not e!409903))))

(declare-fun lt!324610 () SeekEntryResult!7330)

(assert (=> b!732529 (= res!492109 (= (seekEntryOrOpen!0 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324610))))

(assert (=> b!732529 (= lt!324610 (Found!7330 j!159))))

(declare-fun b!732530 () Bool)

(assert (=> b!732530 (= e!409909 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324616 #b00000000000000000000000000000000) (bvsge lt!324616 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!409910 () Bool)

(declare-fun b!732531 () Bool)

(declare-fun lt!324617 () SeekEntryResult!7330)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732531 (= e!409910 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324617))))

(declare-fun b!732532 () Bool)

(declare-fun res!492121 () Bool)

(declare-fun e!409907 () Bool)

(assert (=> b!732532 (=> (not res!492121) (not e!409907))))

(assert (=> b!732532 (= res!492121 e!409910)))

(declare-fun c!80587 () Bool)

(assert (=> b!732532 (= c!80587 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732533 () Bool)

(declare-fun res!492117 () Bool)

(assert (=> b!732533 (=> (not res!492117) (not e!409901))))

(declare-datatypes ((List!13732 0))(
  ( (Nil!13729) (Cons!13728 (h!14794 (_ BitVec 64)) (t!20047 List!13732)) )
))
(declare-fun arrayNoDuplicates!0 (array!41227 (_ BitVec 32) List!13732) Bool)

(assert (=> b!732533 (= res!492117 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13729))))

(declare-fun b!732535 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41227 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732535 (= e!409910 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) (Found!7330 j!159)))))

(declare-fun b!732536 () Bool)

(declare-fun res!492119 () Bool)

(assert (=> b!732536 (=> (not res!492119) (not e!409908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732536 (= res!492119 (validKeyInArray!0 k!2102))))

(declare-fun b!732537 () Bool)

(assert (=> b!732537 (= e!409907 e!409902)))

(declare-fun res!492118 () Bool)

(assert (=> b!732537 (=> (not res!492118) (not e!409902))))

(declare-fun lt!324611 () SeekEntryResult!7330)

(assert (=> b!732537 (= res!492118 (= lt!324611 lt!324615))))

(declare-fun lt!324613 () (_ BitVec 64))

(declare-fun lt!324609 () array!41227)

(assert (=> b!732537 (= lt!324615 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324613 lt!324609 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732537 (= lt!324611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324613 mask!3328) lt!324613 lt!324609 mask!3328))))

(assert (=> b!732537 (= lt!324613 (select (store (arr!19730 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732537 (= lt!324609 (array!41228 (store (arr!19730 a!3186) i!1173 k!2102) (size!20151 a!3186)))))

(declare-fun b!732538 () Bool)

(declare-fun res!492105 () Bool)

(assert (=> b!732538 (=> (not res!492105) (not e!409908))))

(assert (=> b!732538 (= res!492105 (validKeyInArray!0 (select (arr!19730 a!3186) j!159)))))

(declare-fun b!732539 () Bool)

(assert (=> b!732539 (= e!409903 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324610))))

(declare-fun b!732540 () Bool)

(declare-fun res!492110 () Bool)

(assert (=> b!732540 (=> (not res!492110) (not e!409907))))

(assert (=> b!732540 (= res!492110 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19730 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732541 () Bool)

(declare-fun res!492122 () Bool)

(assert (=> b!732541 (=> res!492122 e!409909)))

(assert (=> b!732541 (= res!492122 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) (Found!7330 j!159))))))

(declare-fun b!732542 () Bool)

(assert (=> b!732542 (= e!409901 e!409907)))

(declare-fun res!492114 () Bool)

(assert (=> b!732542 (=> (not res!492114) (not e!409907))))

(assert (=> b!732542 (= res!492114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19730 a!3186) j!159) mask!3328) (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324617))))

(assert (=> b!732542 (= lt!324617 (Intermediate!7330 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732543 () Bool)

(declare-fun res!492113 () Bool)

(assert (=> b!732543 (=> (not res!492113) (not e!409901))))

(assert (=> b!732543 (= res!492113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!492111 () Bool)

(assert (=> start!64916 (=> (not res!492111) (not e!409908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64916 (= res!492111 (validMask!0 mask!3328))))

(assert (=> start!64916 e!409908))

(assert (=> start!64916 true))

(declare-fun array_inv!15526 (array!41227) Bool)

(assert (=> start!64916 (array_inv!15526 a!3186)))

(declare-fun b!732534 () Bool)

(declare-fun res!492112 () Bool)

(assert (=> b!732534 (=> (not res!492112) (not e!409908))))

(assert (=> b!732534 (= res!492112 (and (= (size!20151 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20151 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20151 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64916 res!492111) b!732534))

(assert (= (and b!732534 res!492112) b!732538))

(assert (= (and b!732538 res!492105) b!732536))

(assert (= (and b!732536 res!492119) b!732525))

(assert (= (and b!732525 res!492106) b!732527))

(assert (= (and b!732527 res!492107) b!732543))

(assert (= (and b!732543 res!492113) b!732533))

(assert (= (and b!732533 res!492117) b!732528))

(assert (= (and b!732528 res!492115) b!732542))

(assert (= (and b!732542 res!492114) b!732540))

(assert (= (and b!732540 res!492110) b!732532))

(assert (= (and b!732532 c!80587) b!732531))

(assert (= (and b!732532 (not c!80587)) b!732535))

(assert (= (and b!732532 res!492121) b!732537))

(assert (= (and b!732537 res!492118) b!732526))

(assert (= (and b!732526 res!492120) b!732529))

(assert (= (and b!732529 res!492109) b!732539))

(assert (= (and b!732526 (not res!492116)) b!732524))

(assert (= (and b!732524 (not res!492108)) b!732541))

(assert (= (and b!732541 (not res!492122)) b!732530))

(declare-fun m!685567 () Bool)

(assert (=> b!732527 m!685567))

(declare-fun m!685569 () Bool)

(assert (=> b!732543 m!685569))

(declare-fun m!685571 () Bool)

(assert (=> b!732542 m!685571))

(assert (=> b!732542 m!685571))

(declare-fun m!685573 () Bool)

(assert (=> b!732542 m!685573))

(assert (=> b!732542 m!685573))

(assert (=> b!732542 m!685571))

(declare-fun m!685575 () Bool)

(assert (=> b!732542 m!685575))

(assert (=> b!732531 m!685571))

(assert (=> b!732531 m!685571))

(declare-fun m!685577 () Bool)

(assert (=> b!732531 m!685577))

(assert (=> b!732535 m!685571))

(assert (=> b!732535 m!685571))

(declare-fun m!685579 () Bool)

(assert (=> b!732535 m!685579))

(assert (=> b!732538 m!685571))

(assert (=> b!732538 m!685571))

(declare-fun m!685581 () Bool)

(assert (=> b!732538 m!685581))

(declare-fun m!685583 () Bool)

(assert (=> b!732536 m!685583))

(declare-fun m!685585 () Bool)

(assert (=> b!732533 m!685585))

(declare-fun m!685587 () Bool)

(assert (=> b!732537 m!685587))

(declare-fun m!685589 () Bool)

(assert (=> b!732537 m!685589))

(declare-fun m!685591 () Bool)

(assert (=> b!732537 m!685591))

(assert (=> b!732537 m!685587))

(declare-fun m!685593 () Bool)

(assert (=> b!732537 m!685593))

(declare-fun m!685595 () Bool)

(assert (=> b!732537 m!685595))

(assert (=> b!732529 m!685571))

(assert (=> b!732529 m!685571))

(declare-fun m!685597 () Bool)

(assert (=> b!732529 m!685597))

(declare-fun m!685599 () Bool)

(assert (=> b!732540 m!685599))

(declare-fun m!685601 () Bool)

(assert (=> b!732526 m!685601))

(declare-fun m!685603 () Bool)

(assert (=> b!732526 m!685603))

(declare-fun m!685605 () Bool)

(assert (=> start!64916 m!685605))

(declare-fun m!685607 () Bool)

(assert (=> start!64916 m!685607))

(declare-fun m!685609 () Bool)

(assert (=> b!732524 m!685609))

(declare-fun m!685611 () Bool)

(assert (=> b!732525 m!685611))

(assert (=> b!732539 m!685571))

(assert (=> b!732539 m!685571))

(declare-fun m!685613 () Bool)

(assert (=> b!732539 m!685613))

(assert (=> b!732541 m!685571))

(assert (=> b!732541 m!685571))

(assert (=> b!732541 m!685579))

(push 1)

(assert (not b!732533))

(assert (not start!64916))

(assert (not b!732542))

(assert (not b!732541))

(assert (not b!732537))

(assert (not b!732539))

(assert (not b!732529))

(assert (not b!732531))

(assert (not b!732543))

(assert (not b!732524))

(assert (not b!732525))

(assert (not b!732527))

(assert (not b!732526))

(assert (not b!732538))

(assert (not b!732535))

(assert (not b!732536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

