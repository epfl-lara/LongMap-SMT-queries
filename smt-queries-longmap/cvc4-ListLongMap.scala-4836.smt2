; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66492 () Bool)

(assert start!66492)

(declare-fun b!766553 () Bool)

(declare-fun e!426864 () Bool)

(declare-fun e!426862 () Bool)

(assert (=> b!766553 (= e!426864 e!426862)))

(declare-fun res!518673 () Bool)

(assert (=> b!766553 (=> (not res!518673) (not e!426862))))

(declare-datatypes ((SeekEntryResult!7840 0))(
  ( (MissingZero!7840 (index!33728 (_ BitVec 32))) (Found!7840 (index!33729 (_ BitVec 32))) (Intermediate!7840 (undefined!8652 Bool) (index!33730 (_ BitVec 32)) (x!64630 (_ BitVec 32))) (Undefined!7840) (MissingVacant!7840 (index!33731 (_ BitVec 32))) )
))
(declare-fun lt!340998 () SeekEntryResult!7840)

(declare-fun lt!340992 () SeekEntryResult!7840)

(assert (=> b!766553 (= res!518673 (= lt!340998 lt!340992))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42271 0))(
  ( (array!42272 (arr!20240 (Array (_ BitVec 32) (_ BitVec 64))) (size!20661 (_ BitVec 32))) )
))
(declare-fun lt!340999 () array!42271)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!340995 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42271 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!766553 (= lt!340992 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340995 lt!340999 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766553 (= lt!340998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340995 mask!3328) lt!340995 lt!340999 mask!3328))))

(declare-fun a!3186 () array!42271)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!766553 (= lt!340995 (select (store (arr!20240 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766553 (= lt!340999 (array!42272 (store (arr!20240 a!3186) i!1173 k!2102) (size!20661 a!3186)))))

(declare-fun b!766554 () Bool)

(declare-fun lt!340993 () SeekEntryResult!7840)

(declare-fun lt!340997 () (_ BitVec 32))

(declare-fun e!426857 () Bool)

(assert (=> b!766554 (= e!426857 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!340997 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340993))))

(declare-fun e!426860 () Bool)

(declare-fun b!766555 () Bool)

(assert (=> b!766555 (= e!426860 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340993))))

(declare-fun b!766556 () Bool)

(declare-fun e!426861 () Bool)

(assert (=> b!766556 (= e!426861 e!426857)))

(declare-fun res!518679 () Bool)

(assert (=> b!766556 (=> res!518679 e!426857)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766556 (= res!518679 (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766556 (= lt!340997 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766557 () Bool)

(assert (=> b!766557 (= e!426862 (not e!426861))))

(declare-fun res!518685 () Bool)

(assert (=> b!766557 (=> res!518685 e!426861)))

(assert (=> b!766557 (= res!518685 (or (not (is-Intermediate!7840 lt!340992)) (bvsge x!1131 (x!64630 lt!340992))))))

(declare-fun e!426859 () Bool)

(assert (=> b!766557 e!426859))

(declare-fun res!518677 () Bool)

(assert (=> b!766557 (=> (not res!518677) (not e!426859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42271 (_ BitVec 32)) Bool)

(assert (=> b!766557 (= res!518677 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26406 0))(
  ( (Unit!26407) )
))
(declare-fun lt!340994 () Unit!26406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26406)

(assert (=> b!766557 (= lt!340994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766558 () Bool)

(declare-fun res!518686 () Bool)

(assert (=> b!766558 (=> (not res!518686) (not e!426864))))

(assert (=> b!766558 (= res!518686 e!426860)))

(declare-fun c!84331 () Bool)

(assert (=> b!766558 (= c!84331 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766559 () Bool)

(declare-fun res!518674 () Bool)

(declare-fun e!426855 () Bool)

(assert (=> b!766559 (=> (not res!518674) (not e!426855))))

(assert (=> b!766559 (= res!518674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766560 () Bool)

(declare-fun e!426856 () Bool)

(assert (=> b!766560 (= e!426856 e!426855)))

(declare-fun res!518670 () Bool)

(assert (=> b!766560 (=> (not res!518670) (not e!426855))))

(declare-fun lt!341000 () SeekEntryResult!7840)

(assert (=> b!766560 (= res!518670 (or (= lt!341000 (MissingZero!7840 i!1173)) (= lt!341000 (MissingVacant!7840 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42271 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!766560 (= lt!341000 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766561 () Bool)

(declare-fun res!518681 () Bool)

(assert (=> b!766561 (=> (not res!518681) (not e!426856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766561 (= res!518681 (validKeyInArray!0 k!2102))))

(declare-fun b!766562 () Bool)

(declare-fun res!518676 () Bool)

(assert (=> b!766562 (=> (not res!518676) (not e!426855))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!766562 (= res!518676 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20661 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20661 a!3186))))))

(declare-fun b!766563 () Bool)

(declare-fun res!518672 () Bool)

(assert (=> b!766563 (=> (not res!518672) (not e!426855))))

(declare-datatypes ((List!14242 0))(
  ( (Nil!14239) (Cons!14238 (h!15328 (_ BitVec 64)) (t!20557 List!14242)) )
))
(declare-fun arrayNoDuplicates!0 (array!42271 (_ BitVec 32) List!14242) Bool)

(assert (=> b!766563 (= res!518672 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14239))))

(declare-fun b!766564 () Bool)

(declare-fun res!518680 () Bool)

(assert (=> b!766564 (=> (not res!518680) (not e!426856))))

(declare-fun arrayContainsKey!0 (array!42271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766564 (= res!518680 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766566 () Bool)

(declare-fun res!518678 () Bool)

(assert (=> b!766566 (=> (not res!518678) (not e!426864))))

(assert (=> b!766566 (= res!518678 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20240 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!340996 () SeekEntryResult!7840)

(declare-fun e!426863 () Bool)

(declare-fun b!766567 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42271 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!766567 (= e!426863 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340996))))

(declare-fun b!766568 () Bool)

(assert (=> b!766568 (= e!426860 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) (Found!7840 j!159)))))

(declare-fun b!766569 () Bool)

(assert (=> b!766569 (= e!426855 e!426864)))

(declare-fun res!518683 () Bool)

(assert (=> b!766569 (=> (not res!518683) (not e!426864))))

(assert (=> b!766569 (= res!518683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340993))))

(assert (=> b!766569 (= lt!340993 (Intermediate!7840 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766570 () Bool)

(assert (=> b!766570 (= e!426859 e!426863)))

(declare-fun res!518671 () Bool)

(assert (=> b!766570 (=> (not res!518671) (not e!426863))))

(assert (=> b!766570 (= res!518671 (= (seekEntryOrOpen!0 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!340996))))

(assert (=> b!766570 (= lt!340996 (Found!7840 j!159))))

(declare-fun b!766571 () Bool)

(declare-fun res!518684 () Bool)

(assert (=> b!766571 (=> (not res!518684) (not e!426856))))

(assert (=> b!766571 (= res!518684 (validKeyInArray!0 (select (arr!20240 a!3186) j!159)))))

(declare-fun res!518682 () Bool)

(assert (=> start!66492 (=> (not res!518682) (not e!426856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66492 (= res!518682 (validMask!0 mask!3328))))

(assert (=> start!66492 e!426856))

(assert (=> start!66492 true))

(declare-fun array_inv!16036 (array!42271) Bool)

(assert (=> start!66492 (array_inv!16036 a!3186)))

(declare-fun b!766565 () Bool)

(declare-fun res!518675 () Bool)

(assert (=> b!766565 (=> (not res!518675) (not e!426856))))

(assert (=> b!766565 (= res!518675 (and (= (size!20661 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20661 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20661 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66492 res!518682) b!766565))

(assert (= (and b!766565 res!518675) b!766571))

(assert (= (and b!766571 res!518684) b!766561))

(assert (= (and b!766561 res!518681) b!766564))

(assert (= (and b!766564 res!518680) b!766560))

(assert (= (and b!766560 res!518670) b!766559))

(assert (= (and b!766559 res!518674) b!766563))

(assert (= (and b!766563 res!518672) b!766562))

(assert (= (and b!766562 res!518676) b!766569))

(assert (= (and b!766569 res!518683) b!766566))

(assert (= (and b!766566 res!518678) b!766558))

(assert (= (and b!766558 c!84331) b!766555))

(assert (= (and b!766558 (not c!84331)) b!766568))

(assert (= (and b!766558 res!518686) b!766553))

(assert (= (and b!766553 res!518673) b!766557))

(assert (= (and b!766557 res!518677) b!766570))

(assert (= (and b!766570 res!518671) b!766567))

(assert (= (and b!766557 (not res!518685)) b!766556))

(assert (= (and b!766556 (not res!518679)) b!766554))

(declare-fun m!712525 () Bool)

(assert (=> b!766564 m!712525))

(declare-fun m!712527 () Bool)

(assert (=> b!766567 m!712527))

(assert (=> b!766567 m!712527))

(declare-fun m!712529 () Bool)

(assert (=> b!766567 m!712529))

(declare-fun m!712531 () Bool)

(assert (=> b!766557 m!712531))

(declare-fun m!712533 () Bool)

(assert (=> b!766557 m!712533))

(assert (=> b!766554 m!712527))

(assert (=> b!766554 m!712527))

(declare-fun m!712535 () Bool)

(assert (=> b!766554 m!712535))

(declare-fun m!712537 () Bool)

(assert (=> b!766566 m!712537))

(declare-fun m!712539 () Bool)

(assert (=> b!766563 m!712539))

(assert (=> b!766568 m!712527))

(assert (=> b!766568 m!712527))

(declare-fun m!712541 () Bool)

(assert (=> b!766568 m!712541))

(declare-fun m!712543 () Bool)

(assert (=> b!766560 m!712543))

(declare-fun m!712545 () Bool)

(assert (=> start!66492 m!712545))

(declare-fun m!712547 () Bool)

(assert (=> start!66492 m!712547))

(assert (=> b!766569 m!712527))

(assert (=> b!766569 m!712527))

(declare-fun m!712549 () Bool)

(assert (=> b!766569 m!712549))

(assert (=> b!766569 m!712549))

(assert (=> b!766569 m!712527))

(declare-fun m!712551 () Bool)

(assert (=> b!766569 m!712551))

(declare-fun m!712553 () Bool)

(assert (=> b!766556 m!712553))

(assert (=> b!766555 m!712527))

(assert (=> b!766555 m!712527))

(declare-fun m!712555 () Bool)

(assert (=> b!766555 m!712555))

(assert (=> b!766570 m!712527))

(assert (=> b!766570 m!712527))

(declare-fun m!712557 () Bool)

(assert (=> b!766570 m!712557))

(declare-fun m!712559 () Bool)

(assert (=> b!766561 m!712559))

(declare-fun m!712561 () Bool)

(assert (=> b!766559 m!712561))

(assert (=> b!766571 m!712527))

(assert (=> b!766571 m!712527))

(declare-fun m!712563 () Bool)

(assert (=> b!766571 m!712563))

(declare-fun m!712565 () Bool)

(assert (=> b!766553 m!712565))

(declare-fun m!712567 () Bool)

(assert (=> b!766553 m!712567))

(declare-fun m!712569 () Bool)

(assert (=> b!766553 m!712569))

(declare-fun m!712571 () Bool)

(assert (=> b!766553 m!712571))

(assert (=> b!766553 m!712565))

(declare-fun m!712573 () Bool)

(assert (=> b!766553 m!712573))

(push 1)

(assert (not b!766554))

(assert (not b!766564))

(assert (not b!766560))

(assert (not b!766571))

(assert (not start!66492))

(assert (not b!766568))

(assert (not b!766553))

(assert (not b!766569))

(assert (not b!766561))

(assert (not b!766555))

(assert (not b!766556))

(assert (not b!766570))

(assert (not b!766563))

(assert (not b!766557))

(assert (not b!766559))

(assert (not b!766567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101229 () Bool)

(assert (=> d!101229 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66492 d!101229))

(declare-fun d!101235 () Bool)

(assert (=> d!101235 (= (array_inv!16036 a!3186) (bvsge (size!20661 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66492 d!101235))

(declare-fun b!766633 () Bool)

(declare-fun e!426904 () Bool)

(declare-fun call!35046 () Bool)

(assert (=> b!766633 (= e!426904 call!35046)))

(declare-fun bm!35043 () Bool)

(declare-fun c!84352 () Bool)

(assert (=> bm!35043 (= call!35046 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84352 (Cons!14238 (select (arr!20240 a!3186) #b00000000000000000000000000000000) Nil!14239) Nil!14239)))))

(declare-fun b!766634 () Bool)

(declare-fun e!426906 () Bool)

(declare-fun contains!4080 (List!14242 (_ BitVec 64)) Bool)

(assert (=> b!766634 (= e!426906 (contains!4080 Nil!14239 (select (arr!20240 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766635 () Bool)

(assert (=> b!766635 (= e!426904 call!35046)))

(declare-fun d!101237 () Bool)

(declare-fun res!518710 () Bool)

(declare-fun e!426905 () Bool)

(assert (=> d!101237 (=> res!518710 e!426905)))

(assert (=> d!101237 (= res!518710 (bvsge #b00000000000000000000000000000000 (size!20661 a!3186)))))

(assert (=> d!101237 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14239) e!426905)))

(declare-fun b!766636 () Bool)

(declare-fun e!426903 () Bool)

(assert (=> b!766636 (= e!426905 e!426903)))

(declare-fun res!518709 () Bool)

(assert (=> b!766636 (=> (not res!518709) (not e!426903))))

(assert (=> b!766636 (= res!518709 (not e!426906))))

(declare-fun res!518708 () Bool)

(assert (=> b!766636 (=> (not res!518708) (not e!426906))))

(assert (=> b!766636 (= res!518708 (validKeyInArray!0 (select (arr!20240 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766637 () Bool)

(assert (=> b!766637 (= e!426903 e!426904)))

(assert (=> b!766637 (= c!84352 (validKeyInArray!0 (select (arr!20240 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101237 (not res!518710)) b!766636))

(assert (= (and b!766636 res!518708) b!766634))

(assert (= (and b!766636 res!518709) b!766637))

(assert (= (and b!766637 c!84352) b!766633))

(assert (= (and b!766637 (not c!84352)) b!766635))

(assert (= (or b!766633 b!766635) bm!35043))

(declare-fun m!712593 () Bool)

(assert (=> bm!35043 m!712593))

(declare-fun m!712595 () Bool)

(assert (=> bm!35043 m!712595))

(assert (=> b!766634 m!712593))

(assert (=> b!766634 m!712593))

(declare-fun m!712597 () Bool)

(assert (=> b!766634 m!712597))

(assert (=> b!766636 m!712593))

(assert (=> b!766636 m!712593))

(declare-fun m!712599 () Bool)

(assert (=> b!766636 m!712599))

(assert (=> b!766637 m!712593))

(assert (=> b!766637 m!712593))

(assert (=> b!766637 m!712599))

(assert (=> b!766563 d!101237))

(declare-fun d!101243 () Bool)

(declare-fun res!518715 () Bool)

(declare-fun e!426917 () Bool)

(assert (=> d!101243 (=> res!518715 e!426917)))

(assert (=> d!101243 (= res!518715 (= (select (arr!20240 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101243 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!426917)))

(declare-fun b!766654 () Bool)

(declare-fun e!426918 () Bool)

(assert (=> b!766654 (= e!426917 e!426918)))

(declare-fun res!518716 () Bool)

(assert (=> b!766654 (=> (not res!518716) (not e!426918))))

(assert (=> b!766654 (= res!518716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20661 a!3186)))))

(declare-fun b!766655 () Bool)

(assert (=> b!766655 (= e!426918 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101243 (not res!518715)) b!766654))

(assert (= (and b!766654 res!518716) b!766655))

(assert (=> d!101243 m!712593))

(declare-fun m!712601 () Bool)

(assert (=> b!766655 m!712601))

(assert (=> b!766564 d!101243))

(declare-fun b!766722 () Bool)

(declare-fun e!426957 () SeekEntryResult!7840)

(declare-fun e!426955 () SeekEntryResult!7840)

(assert (=> b!766722 (= e!426957 e!426955)))

(declare-fun c!84391 () Bool)

(declare-fun lt!341046 () (_ BitVec 64))

(assert (=> b!766722 (= c!84391 (or (= lt!341046 lt!340995) (= (bvadd lt!341046 lt!341046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766723 () Bool)

(declare-fun lt!341047 () SeekEntryResult!7840)

(assert (=> b!766723 (and (bvsge (index!33730 lt!341047) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341047) (size!20661 lt!340999)))))

(declare-fun res!518723 () Bool)

(assert (=> b!766723 (= res!518723 (= (select (arr!20240 lt!340999) (index!33730 lt!341047)) lt!340995))))

(declare-fun e!426954 () Bool)

(assert (=> b!766723 (=> res!518723 e!426954)))

(declare-fun e!426953 () Bool)

(assert (=> b!766723 (= e!426953 e!426954)))

(declare-fun b!766724 () Bool)

(assert (=> b!766724 (and (bvsge (index!33730 lt!341047) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341047) (size!20661 lt!340999)))))

(assert (=> b!766724 (= e!426954 (= (select (arr!20240 lt!340999) (index!33730 lt!341047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766726 () Bool)

(assert (=> b!766726 (= e!426955 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340995 lt!340999 mask!3328))))

(declare-fun b!766727 () Bool)

(assert (=> b!766727 (= e!426957 (Intermediate!7840 true index!1321 x!1131))))

(declare-fun b!766728 () Bool)

(declare-fun e!426956 () Bool)

(assert (=> b!766728 (= e!426956 (bvsge (x!64630 lt!341047) #b01111111111111111111111111111110))))

(declare-fun d!101245 () Bool)

(assert (=> d!101245 e!426956))

(declare-fun c!84390 () Bool)

(assert (=> d!101245 (= c!84390 (and (is-Intermediate!7840 lt!341047) (undefined!8652 lt!341047)))))

(assert (=> d!101245 (= lt!341047 e!426957)))

(declare-fun c!84389 () Bool)

(assert (=> d!101245 (= c!84389 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101245 (= lt!341046 (select (arr!20240 lt!340999) index!1321))))

(assert (=> d!101245 (validMask!0 mask!3328)))

(assert (=> d!101245 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340995 lt!340999 mask!3328) lt!341047)))

(declare-fun b!766725 () Bool)

(assert (=> b!766725 (= e!426955 (Intermediate!7840 false index!1321 x!1131))))

(declare-fun b!766729 () Bool)

(assert (=> b!766729 (= e!426956 e!426953)))

(declare-fun res!518724 () Bool)

(assert (=> b!766729 (= res!518724 (and (is-Intermediate!7840 lt!341047) (not (undefined!8652 lt!341047)) (bvslt (x!64630 lt!341047) #b01111111111111111111111111111110) (bvsge (x!64630 lt!341047) #b00000000000000000000000000000000) (bvsge (x!64630 lt!341047) x!1131)))))

(assert (=> b!766729 (=> (not res!518724) (not e!426953))))

(declare-fun b!766730 () Bool)

(assert (=> b!766730 (and (bvsge (index!33730 lt!341047) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341047) (size!20661 lt!340999)))))

(declare-fun res!518725 () Bool)

(assert (=> b!766730 (= res!518725 (= (select (arr!20240 lt!340999) (index!33730 lt!341047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766730 (=> res!518725 e!426954)))

(assert (= (and d!101245 c!84389) b!766727))

(assert (= (and d!101245 (not c!84389)) b!766722))

(assert (= (and b!766722 c!84391) b!766725))

(assert (= (and b!766722 (not c!84391)) b!766726))

(assert (= (and d!101245 c!84390) b!766728))

(assert (= (and d!101245 (not c!84390)) b!766729))

(assert (= (and b!766729 res!518724) b!766723))

(assert (= (and b!766723 (not res!518723)) b!766730))

(assert (= (and b!766730 (not res!518725)) b!766724))

(declare-fun m!712643 () Bool)

(assert (=> b!766730 m!712643))

(assert (=> b!766724 m!712643))

(assert (=> b!766723 m!712643))

(declare-fun m!712645 () Bool)

(assert (=> d!101245 m!712645))

(assert (=> d!101245 m!712545))

(assert (=> b!766726 m!712553))

(assert (=> b!766726 m!712553))

(declare-fun m!712647 () Bool)

(assert (=> b!766726 m!712647))

(assert (=> b!766553 d!101245))

(declare-fun b!766737 () Bool)

(declare-fun e!426966 () SeekEntryResult!7840)

(declare-fun e!426964 () SeekEntryResult!7840)

(assert (=> b!766737 (= e!426966 e!426964)))

(declare-fun c!84396 () Bool)

(declare-fun lt!341048 () (_ BitVec 64))

(assert (=> b!766737 (= c!84396 (or (= lt!341048 lt!340995) (= (bvadd lt!341048 lt!341048) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766738 () Bool)

(declare-fun lt!341049 () SeekEntryResult!7840)

(assert (=> b!766738 (and (bvsge (index!33730 lt!341049) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341049) (size!20661 lt!340999)))))

(declare-fun res!518728 () Bool)

(assert (=> b!766738 (= res!518728 (= (select (arr!20240 lt!340999) (index!33730 lt!341049)) lt!340995))))

(declare-fun e!426963 () Bool)

(assert (=> b!766738 (=> res!518728 e!426963)))

(declare-fun e!426962 () Bool)

(assert (=> b!766738 (= e!426962 e!426963)))

(declare-fun b!766739 () Bool)

(assert (=> b!766739 (and (bvsge (index!33730 lt!341049) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341049) (size!20661 lt!340999)))))

(assert (=> b!766739 (= e!426963 (= (select (arr!20240 lt!340999) (index!33730 lt!341049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766741 () Bool)

(assert (=> b!766741 (= e!426964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340995 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340995 lt!340999 mask!3328))))

(declare-fun b!766742 () Bool)

(assert (=> b!766742 (= e!426966 (Intermediate!7840 true (toIndex!0 lt!340995 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766743 () Bool)

(declare-fun e!426965 () Bool)

(assert (=> b!766743 (= e!426965 (bvsge (x!64630 lt!341049) #b01111111111111111111111111111110))))

(declare-fun d!101257 () Bool)

(assert (=> d!101257 e!426965))

(declare-fun c!84395 () Bool)

(assert (=> d!101257 (= c!84395 (and (is-Intermediate!7840 lt!341049) (undefined!8652 lt!341049)))))

(assert (=> d!101257 (= lt!341049 e!426966)))

(declare-fun c!84394 () Bool)

(assert (=> d!101257 (= c!84394 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101257 (= lt!341048 (select (arr!20240 lt!340999) (toIndex!0 lt!340995 mask!3328)))))

(assert (=> d!101257 (validMask!0 mask!3328)))

(assert (=> d!101257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340995 mask!3328) lt!340995 lt!340999 mask!3328) lt!341049)))

(declare-fun b!766740 () Bool)

(assert (=> b!766740 (= e!426964 (Intermediate!7840 false (toIndex!0 lt!340995 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766744 () Bool)

(assert (=> b!766744 (= e!426965 e!426962)))

(declare-fun res!518729 () Bool)

(assert (=> b!766744 (= res!518729 (and (is-Intermediate!7840 lt!341049) (not (undefined!8652 lt!341049)) (bvslt (x!64630 lt!341049) #b01111111111111111111111111111110) (bvsge (x!64630 lt!341049) #b00000000000000000000000000000000) (bvsge (x!64630 lt!341049) #b00000000000000000000000000000000)))))

(assert (=> b!766744 (=> (not res!518729) (not e!426962))))

(declare-fun b!766745 () Bool)

(assert (=> b!766745 (and (bvsge (index!33730 lt!341049) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341049) (size!20661 lt!340999)))))

(declare-fun res!518730 () Bool)

(assert (=> b!766745 (= res!518730 (= (select (arr!20240 lt!340999) (index!33730 lt!341049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766745 (=> res!518730 e!426963)))

(assert (= (and d!101257 c!84394) b!766742))

(assert (= (and d!101257 (not c!84394)) b!766737))

(assert (= (and b!766737 c!84396) b!766740))

(assert (= (and b!766737 (not c!84396)) b!766741))

(assert (= (and d!101257 c!84395) b!766743))

(assert (= (and d!101257 (not c!84395)) b!766744))

(assert (= (and b!766744 res!518729) b!766738))

(assert (= (and b!766738 (not res!518728)) b!766745))

(assert (= (and b!766745 (not res!518730)) b!766739))

(declare-fun m!712649 () Bool)

(assert (=> b!766745 m!712649))

(assert (=> b!766739 m!712649))

(assert (=> b!766738 m!712649))

(assert (=> d!101257 m!712565))

(declare-fun m!712651 () Bool)

(assert (=> d!101257 m!712651))

(assert (=> d!101257 m!712545))

(assert (=> b!766741 m!712565))

(declare-fun m!712653 () Bool)

(assert (=> b!766741 m!712653))

(assert (=> b!766741 m!712653))

(declare-fun m!712655 () Bool)

(assert (=> b!766741 m!712655))

(assert (=> b!766553 d!101257))

(declare-fun d!101259 () Bool)

(declare-fun lt!341064 () (_ BitVec 32))

(declare-fun lt!341063 () (_ BitVec 32))

(assert (=> d!101259 (= lt!341064 (bvmul (bvxor lt!341063 (bvlshr lt!341063 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101259 (= lt!341063 ((_ extract 31 0) (bvand (bvxor lt!340995 (bvlshr lt!340995 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101259 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!518733 (let ((h!15329 ((_ extract 31 0) (bvand (bvxor lt!340995 (bvlshr lt!340995 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64636 (bvmul (bvxor h!15329 (bvlshr h!15329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64636 (bvlshr x!64636 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!518733 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!518733 #b00000000000000000000000000000000))))))

(assert (=> d!101259 (= (toIndex!0 lt!340995 mask!3328) (bvand (bvxor lt!341064 (bvlshr lt!341064 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!766553 d!101259))

(declare-fun b!766852 () Bool)

(declare-fun e!427037 () SeekEntryResult!7840)

(assert (=> b!766852 (= e!427037 Undefined!7840)))

(declare-fun b!766853 () Bool)

(declare-fun e!427035 () SeekEntryResult!7840)

(declare-fun lt!341100 () SeekEntryResult!7840)

(assert (=> b!766853 (= e!427035 (MissingZero!7840 (index!33730 lt!341100)))))

(declare-fun b!766854 () Bool)

(declare-fun e!427036 () SeekEntryResult!7840)

(assert (=> b!766854 (= e!427036 (Found!7840 (index!33730 lt!341100)))))

(declare-fun b!766855 () Bool)

(assert (=> b!766855 (= e!427037 e!427036)))

(declare-fun lt!341101 () (_ BitVec 64))

(assert (=> b!766855 (= lt!341101 (select (arr!20240 a!3186) (index!33730 lt!341100)))))

(declare-fun c!84431 () Bool)

(assert (=> b!766855 (= c!84431 (= lt!341101 (select (arr!20240 a!3186) j!159)))))

(declare-fun d!101263 () Bool)

(declare-fun lt!341102 () SeekEntryResult!7840)

(assert (=> d!101263 (and (or (is-Undefined!7840 lt!341102) (not (is-Found!7840 lt!341102)) (and (bvsge (index!33729 lt!341102) #b00000000000000000000000000000000) (bvslt (index!33729 lt!341102) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341102) (is-Found!7840 lt!341102) (not (is-MissingZero!7840 lt!341102)) (and (bvsge (index!33728 lt!341102) #b00000000000000000000000000000000) (bvslt (index!33728 lt!341102) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341102) (is-Found!7840 lt!341102) (is-MissingZero!7840 lt!341102) (not (is-MissingVacant!7840 lt!341102)) (and (bvsge (index!33731 lt!341102) #b00000000000000000000000000000000) (bvslt (index!33731 lt!341102) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341102) (ite (is-Found!7840 lt!341102) (= (select (arr!20240 a!3186) (index!33729 lt!341102)) (select (arr!20240 a!3186) j!159)) (ite (is-MissingZero!7840 lt!341102) (= (select (arr!20240 a!3186) (index!33728 lt!341102)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7840 lt!341102) (= (select (arr!20240 a!3186) (index!33731 lt!341102)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101263 (= lt!341102 e!427037)))

(declare-fun c!84429 () Bool)

(assert (=> d!101263 (= c!84429 (and (is-Intermediate!7840 lt!341100) (undefined!8652 lt!341100)))))

(assert (=> d!101263 (= lt!341100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) (select (arr!20240 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101263 (validMask!0 mask!3328)))

(assert (=> d!101263 (= (seekEntryOrOpen!0 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!341102)))

(declare-fun b!766856 () Bool)

(declare-fun c!84430 () Bool)

(assert (=> b!766856 (= c!84430 (= lt!341101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766856 (= e!427036 e!427035)))

(declare-fun b!766857 () Bool)

(assert (=> b!766857 (= e!427035 (seekKeyOrZeroReturnVacant!0 (x!64630 lt!341100) (index!33730 lt!341100) (index!33730 lt!341100) (select (arr!20240 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101263 c!84429) b!766852))

(assert (= (and d!101263 (not c!84429)) b!766855))

(assert (= (and b!766855 c!84431) b!766854))

(assert (= (and b!766855 (not c!84431)) b!766856))

(assert (= (and b!766856 c!84430) b!766853))

(assert (= (and b!766856 (not c!84430)) b!766857))

(declare-fun m!712719 () Bool)

(assert (=> b!766855 m!712719))

(assert (=> d!101263 m!712545))

(assert (=> d!101263 m!712527))

(assert (=> d!101263 m!712549))

(assert (=> d!101263 m!712549))

(assert (=> d!101263 m!712527))

(assert (=> d!101263 m!712551))

(declare-fun m!712721 () Bool)

(assert (=> d!101263 m!712721))

(declare-fun m!712723 () Bool)

(assert (=> d!101263 m!712723))

(declare-fun m!712725 () Bool)

(assert (=> d!101263 m!712725))

(assert (=> b!766857 m!712527))

(declare-fun m!712727 () Bool)

(assert (=> b!766857 m!712727))

(assert (=> b!766570 d!101263))

(declare-fun b!766890 () Bool)

(declare-fun e!427058 () Bool)

(declare-fun e!427057 () Bool)

(assert (=> b!766890 (= e!427058 e!427057)))

(declare-fun lt!341122 () (_ BitVec 64))

(assert (=> b!766890 (= lt!341122 (select (arr!20240 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341120 () Unit!26406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42271 (_ BitVec 64) (_ BitVec 32)) Unit!26406)

(assert (=> b!766890 (= lt!341120 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341122 #b00000000000000000000000000000000))))

(assert (=> b!766890 (arrayContainsKey!0 a!3186 lt!341122 #b00000000000000000000000000000000)))

(declare-fun lt!341121 () Unit!26406)

(assert (=> b!766890 (= lt!341121 lt!341120)))

(declare-fun res!518786 () Bool)

(assert (=> b!766890 (= res!518786 (= (seekEntryOrOpen!0 (select (arr!20240 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7840 #b00000000000000000000000000000000)))))

(assert (=> b!766890 (=> (not res!518786) (not e!427057))))

(declare-fun b!766891 () Bool)

(declare-fun e!427059 () Bool)

(assert (=> b!766891 (= e!427059 e!427058)))

(declare-fun c!84443 () Bool)

(assert (=> b!766891 (= c!84443 (validKeyInArray!0 (select (arr!20240 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!766892 () Bool)

(declare-fun call!35059 () Bool)

(assert (=> b!766892 (= e!427057 call!35059)))

(declare-fun b!766893 () Bool)

(assert (=> b!766893 (= e!427058 call!35059)))

(declare-fun bm!35056 () Bool)

(assert (=> bm!35056 (= call!35059 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101289 () Bool)

(declare-fun res!518787 () Bool)

(assert (=> d!101289 (=> res!518787 e!427059)))

(assert (=> d!101289 (= res!518787 (bvsge #b00000000000000000000000000000000 (size!20661 a!3186)))))

(assert (=> d!101289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427059)))

(assert (= (and d!101289 (not res!518787)) b!766891))

(assert (= (and b!766891 c!84443) b!766890))

(assert (= (and b!766891 (not c!84443)) b!766893))

(assert (= (and b!766890 res!518786) b!766892))

(assert (= (or b!766892 b!766893) bm!35056))

(assert (=> b!766890 m!712593))

(declare-fun m!712753 () Bool)

(assert (=> b!766890 m!712753))

(declare-fun m!712755 () Bool)

(assert (=> b!766890 m!712755))

(assert (=> b!766890 m!712593))

(declare-fun m!712757 () Bool)

(assert (=> b!766890 m!712757))

(assert (=> b!766891 m!712593))

(assert (=> b!766891 m!712593))

(assert (=> b!766891 m!712599))

(declare-fun m!712759 () Bool)

(assert (=> bm!35056 m!712759))

(assert (=> b!766559 d!101289))

(declare-fun b!766900 () Bool)

(declare-fun e!427065 () SeekEntryResult!7840)

(assert (=> b!766900 (= e!427065 Undefined!7840)))

(declare-fun b!766901 () Bool)

(declare-fun e!427063 () SeekEntryResult!7840)

(declare-fun lt!341128 () SeekEntryResult!7840)

(assert (=> b!766901 (= e!427063 (MissingZero!7840 (index!33730 lt!341128)))))

(declare-fun b!766902 () Bool)

(declare-fun e!427064 () SeekEntryResult!7840)

(assert (=> b!766902 (= e!427064 (Found!7840 (index!33730 lt!341128)))))

(declare-fun b!766903 () Bool)

(assert (=> b!766903 (= e!427065 e!427064)))

(declare-fun lt!341129 () (_ BitVec 64))

(assert (=> b!766903 (= lt!341129 (select (arr!20240 a!3186) (index!33730 lt!341128)))))

(declare-fun c!84449 () Bool)

(assert (=> b!766903 (= c!84449 (= lt!341129 k!2102))))

(declare-fun d!101301 () Bool)

(declare-fun lt!341130 () SeekEntryResult!7840)

(assert (=> d!101301 (and (or (is-Undefined!7840 lt!341130) (not (is-Found!7840 lt!341130)) (and (bvsge (index!33729 lt!341130) #b00000000000000000000000000000000) (bvslt (index!33729 lt!341130) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341130) (is-Found!7840 lt!341130) (not (is-MissingZero!7840 lt!341130)) (and (bvsge (index!33728 lt!341130) #b00000000000000000000000000000000) (bvslt (index!33728 lt!341130) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341130) (is-Found!7840 lt!341130) (is-MissingZero!7840 lt!341130) (not (is-MissingVacant!7840 lt!341130)) (and (bvsge (index!33731 lt!341130) #b00000000000000000000000000000000) (bvslt (index!33731 lt!341130) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341130) (ite (is-Found!7840 lt!341130) (= (select (arr!20240 a!3186) (index!33729 lt!341130)) k!2102) (ite (is-MissingZero!7840 lt!341130) (= (select (arr!20240 a!3186) (index!33728 lt!341130)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7840 lt!341130) (= (select (arr!20240 a!3186) (index!33731 lt!341130)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101301 (= lt!341130 e!427065)))

(declare-fun c!84447 () Bool)

(assert (=> d!101301 (= c!84447 (and (is-Intermediate!7840 lt!341128) (undefined!8652 lt!341128)))))

(assert (=> d!101301 (= lt!341128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101301 (validMask!0 mask!3328)))

(assert (=> d!101301 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341130)))

(declare-fun b!766904 () Bool)

(declare-fun c!84448 () Bool)

(assert (=> b!766904 (= c!84448 (= lt!341129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766904 (= e!427064 e!427063)))

(declare-fun b!766905 () Bool)

(assert (=> b!766905 (= e!427063 (seekKeyOrZeroReturnVacant!0 (x!64630 lt!341128) (index!33730 lt!341128) (index!33730 lt!341128) k!2102 a!3186 mask!3328))))

(assert (= (and d!101301 c!84447) b!766900))

(assert (= (and d!101301 (not c!84447)) b!766903))

(assert (= (and b!766903 c!84449) b!766902))

(assert (= (and b!766903 (not c!84449)) b!766904))

(assert (= (and b!766904 c!84448) b!766901))

(assert (= (and b!766904 (not c!84448)) b!766905))

(declare-fun m!712773 () Bool)

(assert (=> b!766903 m!712773))

(assert (=> d!101301 m!712545))

(declare-fun m!712777 () Bool)

(assert (=> d!101301 m!712777))

(assert (=> d!101301 m!712777))

(declare-fun m!712779 () Bool)

(assert (=> d!101301 m!712779))

(declare-fun m!712781 () Bool)

(assert (=> d!101301 m!712781))

(declare-fun m!712783 () Bool)

(assert (=> d!101301 m!712783))

(declare-fun m!712785 () Bool)

(assert (=> d!101301 m!712785))

(declare-fun m!712787 () Bool)

(assert (=> b!766905 m!712787))

(assert (=> b!766560 d!101301))

(declare-fun d!101305 () Bool)

(assert (=> d!101305 (= (validKeyInArray!0 (select (arr!20240 a!3186) j!159)) (and (not (= (select (arr!20240 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20240 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766571 d!101305))

(declare-fun d!101307 () Bool)

(assert (=> d!101307 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!766561 d!101307))

(declare-fun d!101309 () Bool)

(declare-fun lt!341149 () SeekEntryResult!7840)

(assert (=> d!101309 (and (or (is-Undefined!7840 lt!341149) (not (is-Found!7840 lt!341149)) (and (bvsge (index!33729 lt!341149) #b00000000000000000000000000000000) (bvslt (index!33729 lt!341149) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341149) (is-Found!7840 lt!341149) (not (is-MissingVacant!7840 lt!341149)) (not (= (index!33731 lt!341149) resIntermediateIndex!5)) (and (bvsge (index!33731 lt!341149) #b00000000000000000000000000000000) (bvslt (index!33731 lt!341149) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341149) (ite (is-Found!7840 lt!341149) (= (select (arr!20240 a!3186) (index!33729 lt!341149)) (select (arr!20240 a!3186) j!159)) (and (is-MissingVacant!7840 lt!341149) (= (index!33731 lt!341149) resIntermediateIndex!5) (= (select (arr!20240 a!3186) (index!33731 lt!341149)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427095 () SeekEntryResult!7840)

(assert (=> d!101309 (= lt!341149 e!427095)))

(declare-fun c!84463 () Bool)

(assert (=> d!101309 (= c!84463 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!341150 () (_ BitVec 64))

(assert (=> d!101309 (= lt!341150 (select (arr!20240 a!3186) resIntermediateIndex!5))))

(assert (=> d!101309 (validMask!0 mask!3328)))

(assert (=> d!101309 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!341149)))

(declare-fun b!766949 () Bool)

(declare-fun e!427096 () SeekEntryResult!7840)

(assert (=> b!766949 (= e!427096 (MissingVacant!7840 resIntermediateIndex!5))))

(declare-fun b!766950 () Bool)

(assert (=> b!766950 (= e!427096 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766951 () Bool)

(declare-fun e!427097 () SeekEntryResult!7840)

(assert (=> b!766951 (= e!427097 (Found!7840 resIntermediateIndex!5))))

(declare-fun b!766952 () Bool)

(assert (=> b!766952 (= e!427095 Undefined!7840)))

(declare-fun b!766953 () Bool)

(declare-fun c!84464 () Bool)

(assert (=> b!766953 (= c!84464 (= lt!341150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766953 (= e!427097 e!427096)))

(declare-fun b!766954 () Bool)

(assert (=> b!766954 (= e!427095 e!427097)))

(declare-fun c!84465 () Bool)

(assert (=> b!766954 (= c!84465 (= lt!341150 (select (arr!20240 a!3186) j!159)))))

(assert (= (and d!101309 c!84463) b!766952))

(assert (= (and d!101309 (not c!84463)) b!766954))

(assert (= (and b!766954 c!84465) b!766951))

(assert (= (and b!766954 (not c!84465)) b!766953))

(assert (= (and b!766953 c!84464) b!766949))

(assert (= (and b!766953 (not c!84464)) b!766950))

(declare-fun m!712811 () Bool)

(assert (=> d!101309 m!712811))

(declare-fun m!712813 () Bool)

(assert (=> d!101309 m!712813))

(assert (=> d!101309 m!712537))

(assert (=> d!101309 m!712545))

(declare-fun m!712815 () Bool)

(assert (=> b!766950 m!712815))

(assert (=> b!766950 m!712815))

(assert (=> b!766950 m!712527))

(declare-fun m!712817 () Bool)

(assert (=> b!766950 m!712817))

(assert (=> b!766567 d!101309))

(declare-fun lt!341151 () SeekEntryResult!7840)

(declare-fun d!101319 () Bool)

(assert (=> d!101319 (and (or (is-Undefined!7840 lt!341151) (not (is-Found!7840 lt!341151)) (and (bvsge (index!33729 lt!341151) #b00000000000000000000000000000000) (bvslt (index!33729 lt!341151) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341151) (is-Found!7840 lt!341151) (not (is-MissingVacant!7840 lt!341151)) (not (= (index!33731 lt!341151) resIntermediateIndex!5)) (and (bvsge (index!33731 lt!341151) #b00000000000000000000000000000000) (bvslt (index!33731 lt!341151) (size!20661 a!3186)))) (or (is-Undefined!7840 lt!341151) (ite (is-Found!7840 lt!341151) (= (select (arr!20240 a!3186) (index!33729 lt!341151)) (select (arr!20240 a!3186) j!159)) (and (is-MissingVacant!7840 lt!341151) (= (index!33731 lt!341151) resIntermediateIndex!5) (= (select (arr!20240 a!3186) (index!33731 lt!341151)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!427098 () SeekEntryResult!7840)

(assert (=> d!101319 (= lt!341151 e!427098)))

(declare-fun c!84466 () Bool)

(assert (=> d!101319 (= c!84466 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341152 () (_ BitVec 64))

(assert (=> d!101319 (= lt!341152 (select (arr!20240 a!3186) index!1321))))

(assert (=> d!101319 (validMask!0 mask!3328)))

(assert (=> d!101319 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!341151)))

(declare-fun b!766955 () Bool)

(declare-fun e!427099 () SeekEntryResult!7840)

(assert (=> b!766955 (= e!427099 (MissingVacant!7840 resIntermediateIndex!5))))

(declare-fun b!766956 () Bool)

(assert (=> b!766956 (= e!427099 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20240 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766957 () Bool)

(declare-fun e!427100 () SeekEntryResult!7840)

(assert (=> b!766957 (= e!427100 (Found!7840 index!1321))))

(declare-fun b!766958 () Bool)

(assert (=> b!766958 (= e!427098 Undefined!7840)))

(declare-fun b!766959 () Bool)

(declare-fun c!84467 () Bool)

(assert (=> b!766959 (= c!84467 (= lt!341152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766959 (= e!427100 e!427099)))

(declare-fun b!766960 () Bool)

(assert (=> b!766960 (= e!427098 e!427100)))

(declare-fun c!84468 () Bool)

(assert (=> b!766960 (= c!84468 (= lt!341152 (select (arr!20240 a!3186) j!159)))))

(assert (= (and d!101319 c!84466) b!766958))

(assert (= (and d!101319 (not c!84466)) b!766960))

(assert (= (and b!766960 c!84468) b!766957))

(assert (= (and b!766960 (not c!84468)) b!766959))

(assert (= (and b!766959 c!84467) b!766955))

(assert (= (and b!766959 (not c!84467)) b!766956))

(declare-fun m!712819 () Bool)

(assert (=> d!101319 m!712819))

(declare-fun m!712821 () Bool)

(assert (=> d!101319 m!712821))

(declare-fun m!712823 () Bool)

(assert (=> d!101319 m!712823))

(assert (=> d!101319 m!712545))

(assert (=> b!766956 m!712553))

(assert (=> b!766956 m!712553))

(assert (=> b!766956 m!712527))

(declare-fun m!712825 () Bool)

(assert (=> b!766956 m!712825))

(assert (=> b!766568 d!101319))

(declare-fun b!766961 () Bool)

(declare-fun e!427102 () Bool)

(declare-fun e!427101 () Bool)

(assert (=> b!766961 (= e!427102 e!427101)))

(declare-fun lt!341157 () (_ BitVec 64))

(assert (=> b!766961 (= lt!341157 (select (arr!20240 a!3186) j!159))))

(declare-fun lt!341155 () Unit!26406)

(assert (=> b!766961 (= lt!341155 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341157 j!159))))

(assert (=> b!766961 (arrayContainsKey!0 a!3186 lt!341157 #b00000000000000000000000000000000)))

(declare-fun lt!341156 () Unit!26406)

(assert (=> b!766961 (= lt!341156 lt!341155)))

(declare-fun res!518805 () Bool)

(assert (=> b!766961 (= res!518805 (= (seekEntryOrOpen!0 (select (arr!20240 a!3186) j!159) a!3186 mask!3328) (Found!7840 j!159)))))

(assert (=> b!766961 (=> (not res!518805) (not e!427101))))

(declare-fun b!766962 () Bool)

(declare-fun e!427103 () Bool)

(assert (=> b!766962 (= e!427103 e!427102)))

(declare-fun c!84469 () Bool)

(assert (=> b!766962 (= c!84469 (validKeyInArray!0 (select (arr!20240 a!3186) j!159)))))

(declare-fun b!766963 () Bool)

(declare-fun call!35064 () Bool)

(assert (=> b!766963 (= e!427101 call!35064)))

(declare-fun b!766964 () Bool)

(assert (=> b!766964 (= e!427102 call!35064)))

(declare-fun bm!35061 () Bool)

(assert (=> bm!35061 (= call!35064 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101321 () Bool)

(declare-fun res!518806 () Bool)

(assert (=> d!101321 (=> res!518806 e!427103)))

(assert (=> d!101321 (= res!518806 (bvsge j!159 (size!20661 a!3186)))))

(assert (=> d!101321 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427103)))

(assert (= (and d!101321 (not res!518806)) b!766962))

(assert (= (and b!766962 c!84469) b!766961))

(assert (= (and b!766962 (not c!84469)) b!766964))

(assert (= (and b!766961 res!518805) b!766963))

(assert (= (or b!766963 b!766964) bm!35061))

(assert (=> b!766961 m!712527))

(declare-fun m!712829 () Bool)

(assert (=> b!766961 m!712829))

(declare-fun m!712831 () Bool)

(assert (=> b!766961 m!712831))

(assert (=> b!766961 m!712527))

(assert (=> b!766961 m!712557))

(assert (=> b!766962 m!712527))

(assert (=> b!766962 m!712527))

(assert (=> b!766962 m!712563))

(declare-fun m!712833 () Bool)

(assert (=> bm!35061 m!712833))

(assert (=> b!766557 d!101321))

(declare-fun d!101325 () Bool)

(assert (=> d!101325 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341169 () Unit!26406)

(declare-fun choose!38 (array!42271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26406)

(assert (=> d!101325 (= lt!341169 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101325 (validMask!0 mask!3328)))

(assert (=> d!101325 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341169)))

(declare-fun bs!21511 () Bool)

(assert (= bs!21511 d!101325))

(assert (=> bs!21511 m!712531))

(declare-fun m!712857 () Bool)

(assert (=> bs!21511 m!712857))

(assert (=> bs!21511 m!712545))

(assert (=> b!766557 d!101325))

(declare-fun b!766989 () Bool)

(declare-fun e!427121 () SeekEntryResult!7840)

(declare-fun e!427119 () SeekEntryResult!7840)

(assert (=> b!766989 (= e!427121 e!427119)))

(declare-fun c!84481 () Bool)

(declare-fun lt!341170 () (_ BitVec 64))

(assert (=> b!766989 (= c!84481 (or (= lt!341170 (select (arr!20240 a!3186) j!159)) (= (bvadd lt!341170 lt!341170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766990 () Bool)

(declare-fun lt!341171 () SeekEntryResult!7840)

(assert (=> b!766990 (and (bvsge (index!33730 lt!341171) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341171) (size!20661 a!3186)))))

(declare-fun res!518813 () Bool)

(assert (=> b!766990 (= res!518813 (= (select (arr!20240 a!3186) (index!33730 lt!341171)) (select (arr!20240 a!3186) j!159)))))

(declare-fun e!427118 () Bool)

(assert (=> b!766990 (=> res!518813 e!427118)))

(declare-fun e!427117 () Bool)

(assert (=> b!766990 (= e!427117 e!427118)))

(declare-fun b!766991 () Bool)

(assert (=> b!766991 (and (bvsge (index!33730 lt!341171) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341171) (size!20661 a!3186)))))

(assert (=> b!766991 (= e!427118 (= (select (arr!20240 a!3186) (index!33730 lt!341171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!766993 () Bool)

(assert (=> b!766993 (= e!427119 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20240 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766994 () Bool)

(assert (=> b!766994 (= e!427121 (Intermediate!7840 true (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766995 () Bool)

(declare-fun e!427120 () Bool)

(assert (=> b!766995 (= e!427120 (bvsge (x!64630 lt!341171) #b01111111111111111111111111111110))))

(declare-fun d!101333 () Bool)

(assert (=> d!101333 e!427120))

(declare-fun c!84480 () Bool)

(assert (=> d!101333 (= c!84480 (and (is-Intermediate!7840 lt!341171) (undefined!8652 lt!341171)))))

(assert (=> d!101333 (= lt!341171 e!427121)))

(declare-fun c!84479 () Bool)

(assert (=> d!101333 (= c!84479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101333 (= lt!341170 (select (arr!20240 a!3186) (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328)))))

(assert (=> d!101333 (validMask!0 mask!3328)))

(assert (=> d!101333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) (select (arr!20240 a!3186) j!159) a!3186 mask!3328) lt!341171)))

(declare-fun b!766992 () Bool)

(assert (=> b!766992 (= e!427119 (Intermediate!7840 false (toIndex!0 (select (arr!20240 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!766996 () Bool)

(assert (=> b!766996 (= e!427120 e!427117)))

(declare-fun res!518814 () Bool)

(assert (=> b!766996 (= res!518814 (and (is-Intermediate!7840 lt!341171) (not (undefined!8652 lt!341171)) (bvslt (x!64630 lt!341171) #b01111111111111111111111111111110) (bvsge (x!64630 lt!341171) #b00000000000000000000000000000000) (bvsge (x!64630 lt!341171) #b00000000000000000000000000000000)))))

(assert (=> b!766996 (=> (not res!518814) (not e!427117))))

(declare-fun b!766997 () Bool)

(assert (=> b!766997 (and (bvsge (index!33730 lt!341171) #b00000000000000000000000000000000) (bvslt (index!33730 lt!341171) (size!20661 a!3186)))))

(declare-fun res!518815 () Bool)

(assert (=> b!766997 (= res!518815 (= (select (arr!20240 a!3186) (index!33730 lt!341171)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!766997 (=> res!518815 e!427118)))

(assert (= (and d!101333 c!84479) b!766994))

(assert (= (and d!101333 (not c!84479)) b!766989))

(assert (= (and b!766989 c!84481) b!766992))

(assert (= (and b!766989 (not c!84481)) b!766993))

(assert (= (and d!101333 c!84480) b!766995))

(assert (= (and d!101333 (not c!84480)) b!766996))

(assert (= (and b!766996 res!518814) b!766990))

(assert (= (and b!766990 (not res!518813)) b!766997))

(assert (= (and b!766997 (not res!518815)) b!766991))

(declare-fun m!712859 () Bool)

(assert (=> b!766997 m!712859))

(assert (=> b!766991 m!712859))

(assert (=> b!766990 m!712859))

(assert (=> d!101333 m!712549))

(declare-fun m!712861 () Bool)

(assert (=> d!101333 m!712861))

(assert (=> d!101333 m!712545))

(assert (=> b!766993 m!712549))

(declare-fun m!712863 () Bool)

